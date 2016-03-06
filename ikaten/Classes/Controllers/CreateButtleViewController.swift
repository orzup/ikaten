import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var params: Dictionary<String, AnyObject>!

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    private func createButtle() {
        SVProgressHUD.show()
        setParams()

        StatInk().createButtle(Battle(data: params),
            onSuccess: { (response) -> Void in
                SVProgressHUD.showSuccessWithStatus("キロク OK!")
            }, onFailure: { (errorResponse) -> Void in
                SVProgressHUD.showErrorWithStatus("失敗")
        })
    }

    private func setParams() {
        params["rankAfter"]    = ""
        params["rankExpAfter"] = 0
        params["result"]       = ""
        params["kill"]         = 0
        params["death"]        = 0
        params["knockOut"]     = false
    }
}
