//
//  Router.swift
//  ikaten
//
//  Created by Nakano Asami on 2016/03/05.
//  Copyright © 2016年 orzup. All rights reserved.
//

import Alamofire
import KeychainAccess

enum Router: URLRequestConvertible {
    static let statInkBaseURLString = "https://stat.ink/api/v1"
    static let splapiBaseURLString = "http://splapi.retrorocket.biz"
    static var OAuthToken: String?

    case CreateBattle(Battle)
    case CheckAPIKey(String)
    case CheckStage(String)
    case GetWeapon(Void)

    var method: Alamofire.Method {
        switch self {
        case .CreateBattle:
            return .POST
        case .CheckAPIKey:
            return .POST
        case .CheckStage:
            return .GET
        case .GetWeapon:
            return .GET
        }
        
    }

    var path: String {
        switch self {
        case .CreateBattle:
            return "/battle"
        case .CheckAPIKey:
            return "/battle"
        case .CheckStage(let rule):
            return "/\(rule)/now"
        case .GetWeapon:
            return "/weapon"
        }
    }

    var URLRequest: NSMutableURLRequest {
        var URL: NSURL
        switch self {
        case .CheckStage:
            URL = NSURL(string: Router.splapiBaseURLString)!
        default:
            URL = NSURL(string: Router.statInkBaseURLString)!
        }
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue

        switch self {
        case .CreateBattle(let battle):
            var params = battle.decode()
            params["apikey"] = Keychain()[string: "APIKey"]
            params["test"]   = "dry_run"
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: params).0
        case .CheckAPIKey(let APIKey):
            let params = ["apikey": APIKey, "test": "dry_run"]
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: params).0
        case .GetWeapon():
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        default:
            return mutableURLRequest
        }
    }
}
