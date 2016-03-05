//
//  StatInk.swift
//  ikaten
//
//  Created by Nakano Asami on 2016/03/05.
//  Copyright © 2016年 orzup. All rights reserved.
//

import Alamofire

class StatInk {
    func createButtle(
        battle: Battle,
        onSuccess: () -> Void,
        onFailure: () -> Void
        ) -> Void  {
            Alamofire.request(Router.CreateBattle(battle)).responseJSON { (response) -> Void in
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
