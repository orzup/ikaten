import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!
    var stages: Stages!

    @IBOutlet weak var mapSelector: UISegmentedControl!
    @IBOutlet weak var resultSelector: UISegmentedControl!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathTextField: UITextField!
    @IBOutlet weak var rankExpChangeTextField: UITextField!

    override func viewDidLoad() {
        mapSelector.setTitle(stages.firstStage().name,  forSegmentAtIndex: 0)
        mapSelector.setTitle(stages.secondStage().name, forSegmentAtIndex: 1)
    }

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    private func createButtle() {
        SVProgressHUD.show()
        battle.setResult([
            "map":           selectStage(),
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

    private func selectStage() -> Stage {
        return stages.selectStage(mapSelector.selectedSegmentIndex)
    }
}

