import UIKit

class PreparationViewController: UITableViewController {
    @IBOutlet weak var squadDetailLabel: UILabel!
    @IBOutlet weak var weaponDetailLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!
    @IBOutlet var stageDetailLabel: [UILabel]!
    
    enum Data : Int {
        case Mode = 0
        case Weapon
        case StageFirst
        case StageSecond
        case Rule
    }

    var lobby: Lobby!
    var weapon: Weapon!
    var stages: Stages!
    var currentStages: Stages!
    var rule: Rule!

    override func viewDidLoad() {
        navigationItem.title = lobby.name
    }

    override func viewDidAppear(animated: Bool) {
        squadDetailLabel.text = self.lobby.name

        StatInk().indexStage({ (stages) -> Void in
            Splapi.checkStage(self.lobby, onSuccess: { (currentStagesName, rule) -> Void in
                self.rule = rule
                self.ruleDetailLabel.text = self.rule.name
                self.currentStages = Stages()

                for (index, stageName) in currentStagesName.enumerate() {
                    self.currentStages.append(stages.indexOf(stageName)!)
                    self.stageDetailLabel[index].text = self.currentStages.nameAtIndex(index)
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
            nextViewController.currentStages = self.currentStages
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
            StatInk().indexWeapon({ (weapons) -> Void in
                self.performSegueWithIdentifier("toSelectViewController",
                    sender: ["indexPath": indexPath, "collection": weapons]
                )
                }) { () -> Void in
            }
        case Data.StageFirst.rawValue, Data.StageSecond.rawValue:
            self.performSegueWithIdentifier("toSelectViewController",sender: ["indexPath": indexPath, "collection": self.stages])
        default:
            break
        }
    }

    private func params() -> Dictionary<String, AnyObject> {
        return [
            "lobby":    lobby,
            "rule":     rule,
            "weapon":   weapon,
            "rank":     "s",
            "rank_exp": 0,
        ]
    }
}
