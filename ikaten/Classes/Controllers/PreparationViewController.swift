import UIKit

class PreparationViewController: UITableViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCreateBattleView" {
            let nextViewController = segue.destinationViewController as! CreateButtleViewController
            nextViewController.battle = Battle(data: params())
        }
    }

    func params() -> Dictionary<String, AnyObject> {
        return [
            "lobby":    "squad_2",
            "rule":     "area",
            "map":      "shottsuru",
            "weapon":   "52gal",
            "rank":     "s",
            "rank_exp": 0,
        ]
    }
}
