import UIKit
import KeychainAccess
import SVProgressHUD

class SessionViewController: UIViewController {
    @IBOutlet weak var APIKeyTextField: UITextField!
    
    override func viewDidAppear(animated: Bool) {
        if Keychain()[string: "APIKey"] != nil {
            goToLobbyViewController()
        }
    }
    
    @IBAction func touchUpInsideSubmitButton(sender: AnyObject) {
        SVProgressHUD.show()
        checkAPIKey()
    }
    
    private func goToLobbyViewController() {
        performSegueWithIdentifier("toLobbyViewController", sender: nil)
    }
    
    private func checkAPIKey() {
        StatInk().checkAPIKey(self.APIKeyTextField.text!,
            onSuccess: { () -> Void in
                SVProgressHUD.dismiss()
                self.goToLobbyViewController()
            }) { (errorResponse) -> Void in
                SVProgressHUD.showErrorWithStatus("失敗")
        }
    }
}
