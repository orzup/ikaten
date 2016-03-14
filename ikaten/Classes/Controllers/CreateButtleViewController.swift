import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!

    @IBOutlet weak var mapSelector: UISegmentedControl!
    @IBOutlet weak var resultSelector: UISegmentedControl!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathTextField: UITextField!
    @IBOutlet weak var rankExpChangeTextField: UITextField!

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    private func createButtle() {
        SVProgressHUD.show()
        // TODO: マップの取得
        battle.setResult([
            "map":           "",
            "result":        resultSelector.selectedSegmentIndex,
            "kill":          Int(killsTextField.text!)!,
            "death":         Int(deathTextField.text!)!,
            "rankExpChange": Int(rankExpChangeTextField.text!)!,
            "knockOut":      false
            ])

        StatInk().createButtle(battle,
            onSuccess: { (response) -> Void in
                SVProgressHUD.showSuccessWithStatus("キロク OK!")
            }, onFailure: { (errorResponse) -> Void in
                SVProgressHUD.showErrorWithStatus("失敗")
        })
    }
}

