import Alamofire

class Splapi {
    func checkStage(
        stage: String,
        onSuccess: () -> Void,
        onFailure: () -> Void
        ) -> Void {
            Alamofire.request(Router.CheckStage(stage)).responseJSON { (response) -> Void in
                switch response.result {
                case .Success(let result):
                    let error: AnyObject? = result["error"]
                    if error != nil {
                        onFailure()
                    } else {
                        onSuccess()
                    }
                case .Failure(_):
                    onFailure()
                }
            }
    }
}
