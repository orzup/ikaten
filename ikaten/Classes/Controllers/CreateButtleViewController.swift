import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!
    var currentStages: Array<String>!

    @IBOutlet weak var mapSelector: UISegmentedControl!
    @IBOutlet weak var resultSelector: UISegmentedControl!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathTextField: UITextField!
    @IBOutlet weak var rankExpChangeTextField: UITextField!

    override func viewDidLoad() {
        mapSelector.setTitle(currentStages.first,  forSegmentAtIndex: 0)
        mapSelector.setTitle(currentStages.last, forSegmentAtIndex: 1)
    }

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    private func createButtle() {
        SVProgressHUD.show()
        battle.setResult([
            "map":           currentStages[mapSelector.selectedSegmentIndex],
            "is_win":        resultSelector.selectedSegmentIndex == 0,
            "kill":          Int(killsTextField.text!)!,
            "death":         Int(deathTextField.text!)!,
            "rankExpChange": Int(rankExpChangeTextField.text!)!,
            "knock_out":     false
            ])

        StatInk().createButtle(battle,
            onSuccess: { (response) -> Void in
                SVProgressHUD.showSuccessWithStatus("キロク OK!")
            }, onFailure: { (errorResponse) -> Void in
                SVProgressHUD.showErrorWithStatus("失敗")
        })
    }
}

