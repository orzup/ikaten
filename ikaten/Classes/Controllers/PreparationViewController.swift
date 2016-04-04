import UIKit

class PreparationViewController: UITableViewController {
    @IBOutlet weak var ruleDetailLabel: UILabel!
    @IBOutlet var stageDetailLabels: [UILabel]!
    @IBOutlet weak var weaponDetailLabel: UILabel!

    var lobby: Lobby!
    var weapons: Weapons!
    var stages: Stages!
    var rules: Rules!

    override func viewDidLoad() {
        navigationItem.title = lobby.name

        StatInk().indexWeapon({ (weapons) -> Void in
            self.weapons = weapons
            }) { () -> Void in
        }

        StatInk().indexStage({ (stages) -> Void in
            StatInk().indexRule({ (rules) -> Void in
                Splapi.checkStage(self.lobby, onSuccess: { (stageNames, rule) -> Void in
                    self.stages = stages
                    self.rules = rules
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
    }

    func params() -> Dictionary<String, AnyObject> {
        return [:]
    }
}
