import UIKit

class PreparationViewController: UITableViewController {
    var stages: Stages!
    var rule: Rule!

    override func viewDidLoad() {
        Splapi.checkStage("gachi", onSuccess: { (stages, rule) -> Void in
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
            "lobby":    "squad_2",
            "rule":     rule,
            "weapon":   "52gal",
            "rank":     "s",
            "rank_exp": 0,
        ]
    }
}
