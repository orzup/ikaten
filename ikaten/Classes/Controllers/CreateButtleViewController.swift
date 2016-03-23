import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!
    var stages: Stages!

    @IBOutlet weak var stageSegmentedControl: UISegmentedControl!
    @IBOutlet weak var isWinSegmentedControl: UISegmentedControl!
    @IBOutlet weak var isTimeUpSegmentedControl: UISegmentedControl!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathTextField: UITextField!
    @IBOutlet weak var rankExpChangeTextField: UITextField!

    @IBAction func singleTapView(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    override func viewDidLoad() {
        stageSegmentedControl.setTitle(stages.firstStage().name, forSegmentAtIndex: 0)
        stageSegmentedControl.setTitle(stages.secondStage().name, forSegmentAtIndex: 1)
    }

    private func createButtle() {
        SVProgressHUD.show()
        battle.setResult([
            "map":           stages.stageAtIndex(stageSegmentedControl.selectedSegmentIndex),
            "is_win":        isWinSegmentedControl.selectedSegmentIndex == 0,
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

