import UIKit

class PreparationViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var squadDetailLabel: UILabel!
    @IBOutlet weak var weaponDetailLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!
    @IBOutlet var stageDetailLabels: [UILabel]!
    @IBOutlet weak var rankTextField: UITextField!

    enum Data : Int {
        case Mode = 0
        case Weapon
        case StageFirst
        case StageSecond
        case Rule
    }

    var lobby: Lobby!
    var weapons: Weapons!
    var stages: Stages!
    var rule: Rule!

    private var selectedRank = Udemae.ranks.first!
    private var selectedExp = Udemae.exps().first!
    private var exps: Array<Int> = []

    override func viewDidLoad() {
        navigationItem.title = lobby.name
        squadDetailLabel.text = lobby.name

        StatInk().indexWeapon({ (weapons) -> Void in
            self.weapons = weapons
            }) { () -> Void in
        }

        StatInk().indexStage({ (stages) -> Void in
            Splapi.checkStage(self.lobby, onSuccess: { (stageNames, rule) -> Void in
                self.stages = stages
                self.rule = rule
                self.ruleDetailLabel.text = self.rule.name

                for (index, stageName) in stageNames.enumerate() {
                    self.stageDetailLabels[index].text = stages.indexOf(stageName)?.name
                }
                }) { () -> Void in
            }
            }) { () -> Void in
        }

        let pickerView = UIPickerView()
        pickerView.delegate = self
        rankTextField.inputView = pickerView
        exps = Udemae.exps()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCreateBattleView" {
            let nextViewController = segue.destinationViewController as! CreateButtleViewController
            nextViewController.battle = Battle(data: params())
            nextViewController.stages = Stages(stageDetailLabels.map{ stages.indexOf($0.text!)! })
        }

        if segue.identifier == "toSelectViewController" {
            let nextViewController = segue.destinationViewController as! SelectViewController
            nextViewController.selectedIndexPath = sender!["indexPath"] as! NSIndexPath
            nextViewController.collection = sender!["collection"] as! DataCollection 
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case Data.Weapon.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": weapons])
        case Data.StageFirst.rawValue, Data.StageSecond.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": stages])
        default:
            break
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return Udemae.ranks.count
        } else {
            return Udemae.expsMax
        }
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return Udemae.ranks[row]
        } else {
            return String(exps[row])
        }
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedRank = Udemae.ranks[row]
        } else {
            selectedExp = exps[row]
        }
        rankTextField.text = "\(selectedRank) \(selectedExp)"
    }

    private func params() -> Dictionary<String, AnyObject> {
        return [
            "lobby":    lobby,
            "rule":     rule,
            "weapon":   weapons.indexOf(weaponDetailLabel.text!)!,
            "udemae":   Udemae(rank: selectedRank, exp: selectedExp)
        ]
    }
}
