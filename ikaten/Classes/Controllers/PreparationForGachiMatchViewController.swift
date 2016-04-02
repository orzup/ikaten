import UIKit

class PreparationForGachiMatchViewController: PreparationViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var rankTextField: UITextField!

    enum Data : Int {
        case StageFirst = 0
        case StageSecond
        case Rule
        case Weapon
    }

    private var exps: Array<Int> = ([Int])(Udemae.expMin..<Udemae.expMax)
    private var selectedRank = Udemae.ranks.first!
    private var selectedExp: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        selectedExp = exps.first!

        let pickerView = UIPickerView()
        pickerView.delegate = self
        rankTextField.inputView = pickerView
        rankTextField.text = udemaeToString()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case Data.StageFirst.rawValue, Data.StageSecond.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": stages])
        case Data.Rule.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": rules])
        case Data.Weapon.rawValue:
            self.performSegueWithIdentifier("toSelectViewController", sender: ["indexPath": indexPath, "collection": weapons])
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
            return Udemae.expMax
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
        rankTextField.text = udemaeToString()
    }

    override func params() -> Dictionary<String, AnyObject> {
        return [
            "lobby":    lobby,
            "rule":     rules.indexOf(ruleDetailLabel.text!)!,
            "weapon":   weapons.indexOf(weaponDetailLabel.text!)!,
            "udemae":   Udemae(rank: selectedRank, exp: selectedExp)
        ]
    }

    private func udemaeToString() -> String {
        return "\(selectedRank) \(selectedExp)"
    }
}
