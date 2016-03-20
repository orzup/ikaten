import Alamofire

class Splapi {
    class func checkStage(
        lobby: Lobby,
        onSuccess: (Stages, Rule) -> Void,
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
                        let stages = Stages(data: data)
                        let rule = data["rule"] == nil ? Rule("ナワバリバトル") : Rule(data["rule"] as! String)
                        onSuccess(stages, rule)
                    }
                case .Failure(_):
                    onFailure()
                }
            }
    }
}
