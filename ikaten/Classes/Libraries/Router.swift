//
//  Router.swift
//  ikaten
//
//  Created by Nakano Asami on 2016/03/05.
//  Copyright © 2016年 orzup. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://stat.ink/api/v1"
    static var OAuthToken: String?

    case CreateBattle([String: AnyObject])

    var method: Alamofire.Method {
        switch self {
        case .CreateBattle:
            return .POST
        }
    }

    var path: String {
        switch self {
        case .CreateBattle:
            return "/battle"
        }
    }

    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue

        switch self {
        case .CreateBattle(let params):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: params).0
        }
    }
}
