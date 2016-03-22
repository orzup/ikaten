import UIKit

class PreparationViewController: UITableViewController {
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
    var currentStages: Array<String>!
    var rule: Rule!

    override func viewDidLoad() {
        navigationItem.title = lobby.name

        StatInk().indexStage({ (stages) -> Void in
            self.stages = stages
            }) { () -> Void in
        }
    }

    override func viewDidAppear(animated: Bool) {
        Splapi.checkStage(lobby, onSuccess: { (stages, rule) -> Void in
            self.currentStages = stages
            self.rule = rule

            for (index, currentStage) in self.currentStages.enumerate() {
                let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: Data.StageFirst.rawValue + index, inSection: 0))
                cell!.detailTextLabel?.text = currentStage
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
