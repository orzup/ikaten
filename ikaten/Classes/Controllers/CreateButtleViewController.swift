import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!
    var stages: Stages!

    var stageSelector : IkatenSegmentedControl?
    var isWinSelector : IkatenSegmentedControl?
    var isKnockoutSelector : IkatenSegmentedControl?

    @IBOutlet weak var formStackView: UIStackView!
    @IBOutlet weak var stageSelectorContainer: UIView!
    @IBOutlet weak var isWinSelectorContainer: UIView!
    @IBOutlet weak var isKnockoutSelectorContainer: UIView!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathTextField: UITextField!
    @IBOutlet weak var rankExpChangeTextField: UITextField!

    override func viewDidLayoutSubviews() {
        stageSelector = IkatenSegmentedControl(items: [stages.firstStage().name, stages.secondStage().name], container: stageSelectorContainer)
        isWinSelector = IkatenSegmentedControl(items: ["かち", "まけ"], container: isWinSelectorContainer)
        isKnockoutSelector = IkatenSegmentedControl(items: ["ノックアウト", "タイムアップ"], container: isKnockoutSelectorContainer)
    }

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    private func createButtle() {
        SVProgressHUD.show()
        battle.setResult([
            "map":           stages.stageAtIndex(Int(stageSelector!.selectedSegmentIndex)),
            "is_win":        Int(isWinSelector!.selectedSegmentIndex) == 0,
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

