//
//  StatInk.swift
//  ikaten
//
//  Created by Nakano Asami on 2016/03/05.
//  Copyright © 2016年 orzup. All rights reserved.
//

import Alamofire
import KeychainAccess
import SVProgressHUD

class StatInk {
    func createButtle(
        params: Dictionary<String, String>,
        onSuccess: (response: NSHTTPURLResponse) -> Void,
        onFailure: (errorResponse: NSHTTPURLResponse) -> Void
        ) -> Void  {
            Alamofire.request(Router.CreateBattle(params)).responseJSON { (response) -> Void in
                switch response.result {
                    case .Success(let data):
                        print(data)
                    case .Failure(let error):
                        print(error)
                }
            }
    }
    
    func checkAPIKey(
        APIKey: String,
        onSuccess: () -> Void,
        onFailure: () -> Void
        ) -> Void {
        Alamofire.request(Router.CheckAPIKey(APIKey)).responseJSON { (response) -> Void in
            switch response.result {
            case .Success(let data):
                let value: AnyObject? = data["error"]
                if value != nil {
                    onFailure()
                } else {
                    let keychain = Keychain(service: NSBundle.mainBundle().bundleIdentifier!)
                    keychain["APIKey"] = APIKey
                    onSuccess()
                }
            case .Failure:
                onFailure()
            }
        }
    }
}
