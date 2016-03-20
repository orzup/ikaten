import UIKit

class LobbyViewController: UIViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCreateBattleView" {
            let button = sender as! UIButton
            let nextViewController = segue.destinationViewController as! PreparationViewController
            nextViewController.lobby = Lobby(button.titleLabel!.text!)
        }
    }
}
