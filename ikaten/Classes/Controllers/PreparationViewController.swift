import UIKit

class PreparationViewController: UITableViewController {
    var lobby: Lobby!
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
    }

    private func params() -> Dictionary<String, AnyObject> {
        return [
            "lobby":    lobby,
            "rule":     rule,
            "weapon":   "52gal",
            "rank":     "s",
            "rank_exp": 0,
        ]
    }
}
