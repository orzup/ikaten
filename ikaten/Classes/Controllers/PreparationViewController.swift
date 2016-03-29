import UIKit

class PreparationViewController: UITableViewController {
    @IBOutlet weak var squadDetailLabel: UILabel!
    @IBOutlet weak var weaponDetailLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!
    @IBOutlet var stageDetailLabels: [UILabel]!
    
    enum Data : Int {
        case Mode = 0
        case Weapon
        case StageFirst
        case StageSecond
        case Rule
    }

    var lobby: Lobby!
    var weapons: Weapons!
    var stages: Stages!
    var rules: Rules!

    override func viewDidLoad() {
        navigationItem.title = lobby.name
        squadDetailLabel.text = lobby.name

        StatInk().indexWeapon({ (weapons) -> Void in
            self.weapons = weapons
            }) { () -> Void in
        }

        StatInk().indexStage({ (stages) -> Void in
            StatInk().indexRule({ (rules) -> Void in
                Splapi.checkStage(self.lobby, onSuccess: { (stageNames, rule) -> Void in
                    self.stages = stages
                    self.rules = rules.gachi()
                    self.ruleDetailLabel.text = rules.indexOf(rule)?.name

                    for (index, stageName) in stageNames.enumerate() {
                        self.stageDetailLabels[index].text = stages.indexOf(stageName)?.name
                    }
                    }) { () -> Void in
                }
                }) { () -> Void in
            }
            }) { () -> Void in
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCreateBattleView" {
            let nextViewController = segue.destinationViewController as! CreateButtleViewController
            nextViewController.battle = Battle(data: params())
            nextViewController.stages = Stages(stageDetailLabels.map{ stages.indexOf($0.text!)! })
        }

        if segue.identifier == "toSelectViewController" {
            let nextViewController = segue.destinationViewController as! SelectViewController
            nextViewController.selectedIndexPath = sender!["indexPath"] as! NSIndexPath
            nextViewController.collection = sender!["collection"] as! DataCollection 
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case Data.Weapon.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": weapons])
        case Data.StageFirst.rawValue, Data.StageSecond.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": stages])
        case Data.Rule.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": rules])
        default:
            break
        }
    }

    private func params() -> Dictionary<String, AnyObject> {
        return [
            "lobby":    lobby,
            "rule":     rules.indexOf(ruleDetailLabel.text!)!,
            "weapon":   weapons.indexOf(weaponDetailLabel.text!)!,
            "rank":     "s",
            "rank_exp": 0,
        ]
    }
}
