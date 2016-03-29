import Alamofire

class Splapi {
    class func checkStage(
        lobby: Lobby,
        onSuccess: (Array<String>, String) -> Void,
        onFailure: () -> Void
        ) -> Void {
            Alamofire.request(Router.CheckStage(lobby)).responseJSON { (response) -> Void in
                switch response.result {
                case .Success(let result):
                    let error: AnyObject? = result["error"]
                    if error != nil {
                        onFailure()
                    } else {
                        let data = (result["result"] as! NSArray).firstObject as! Dictionary<String, AnyObject>
                        let stages = data["maps"] as! Array<String>
                        let rule = data["rule"] as! String
                        onSuccess(stages, rule)
                    }
                case .Failure(_):
                    onFailure()
                }
            }
    }
}
