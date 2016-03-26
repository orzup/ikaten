import UIKit
import SVProgressHUD

class CreateButtleViewController: UIViewController {
    var battle: Battle!
    var stages: Stages!

    var stageSelector:    IkatenSegmentedControl!
    var isLoseSelector:   IkatenSegmentedControl!
    var isTimeUpSelector: IkatenSegmentedControl!

    @IBOutlet weak var stageSegmentedControlContainer: UIView!
    @IBOutlet weak var isLoseSegmentedControlContainer: UIView!
    @IBOutlet weak var isTimeUpSegmentedControlContainer: UIView!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathTextField: UITextField!
    @IBOutlet weak var udemaeLabel: UILabel!
    @IBOutlet weak var rankExpChangeTextField: UITextField!

    @IBAction func singleTapView(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func touchUpInsideNextBattleButton(sender: AnyObject) {
        createButtle()
    }

    override func viewDidLoad() {
        udemaeLabel.text = "\(battle.udemae.rank)\(battle.udemae.exp)"
    }

    override func viewDidLayoutSubviews() {
        stageSelector = IkatenSegmentedControl(items: [stages.first().name, stages.second().name], container: stageSegmentedControlContainer)
        isLoseSelector = IkatenSegmentedControl(items: ["WIN", "LOSE"], container: isLoseSegmentedControlContainer, font: UIFont(name: "ProjectPaintball", size: 30)!)
        isTimeUpSelector = IkatenSegmentedControl(items: ["ノックアウト", "タイムアップ"], container: isTimeUpSegmentedControlContainer)
        }

    private func createButtle() {
        SVProgressHUD.show()
        let isWin = Int(isLoseSelector.selectedSegmentIndex) == 0
        battle.setResult([
            "map":           stages.dataAtIndex(Int(stageSelector!.selectedSegmentIndex)),
            "is_win":        isWin,
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
