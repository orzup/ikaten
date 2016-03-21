import UIKit

class PreparationViewController: UITableViewController {
    enum Data : Int {
        case Mode = 0
        case Weapon
        case Stage
        case Rule
    }

    var lobby: Lobby!
    var weapon: Weapon!
    var stages: Stages!
    var rule: Rule!

    override func viewDidLoad() {
        navigationItem.title = lobby.name

        Splapi.checkStage(lobby, onSuccess: { (stages, rule) -> Void in
            self.stages = stages
            self.rule = rule
        }) { () -> Void in
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCreateBattleView" {
            let nextViewController = segue.destinationViewController as! CreateButtleViewController
            nextViewController.battle = Battle(data: params())
            nextViewController.stages = self.stages
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
