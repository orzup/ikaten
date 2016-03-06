import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    private func createButtle() {
        setButtle()

        StatInk().createButtle(battle,
            onSuccess: { (response) -> Void in
                SVProgressHUD.showSuccessWithStatus("キロク OK!")
            }, onFailure: { (errorResponse) -> Void in
                SVProgressHUD.showErrorWithStatus("失敗")
        })
    }

    private func setButtle() {
        battle.rankAfter    = ""
        battle.rankExpAfter = 0
        battle.result       = ""
        battle.kill         = 0
        battle.death        = 0
        battle.knockOut     = false
    }
}
