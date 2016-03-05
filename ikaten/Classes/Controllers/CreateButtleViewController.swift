import UIKit

class CreateButtleViewController: UIViewController {
    var battle: Battle!

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    func createButtle() {
        battle.rankAfter    = ""
        battle.rankExpAfter = 0
        battle.result       = ""
        battle.kill         = 0
        battle.death        = 0
        battle.knockOut     = false

        StatInk().createButtle(battle,
            onSuccess: { (response) -> Void in
                print("OK!")
            }, onFailure: { (errorResponse) -> Void in
                print("NG!")
        })
    }
}
