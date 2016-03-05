import UIKit
import KeychainAccess
import SVProgressHUD

class SessionViewController: UIViewController {
    @IBOutlet weak var APIKeyTextField: UITextField!
    
    override func viewDidAppear(animated: Bool) {
        if Keychain()[string: "APIKey"] != nil {
            self.performSegueWithIdentifier("toLobbyViewController",sender: nil)
        }
    }
    
    @IBAction func touchUpInsideSubmitButton(sender: AnyObject) {
        SVProgressHUD.show()
        StatInk().checkAPIKey(self.APIKeyTextField.text!,
            onSuccess: { () -> Void in
                let keychain = Keychain(service: NSBundle.mainBundle().bundleIdentifier!)
                keychain["APIKey"] = self.APIKeyTextField.text
                SVProgressHUD.dismiss()
                self.performSegueWithIdentifier("toLobbyViewController", sender: nil)
            }) { (errorResponse) -> Void in
                SVProgressHUD.showErrorWithStatus("失敗")
        }
    }
}
