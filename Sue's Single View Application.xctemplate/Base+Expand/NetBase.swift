//
//  NetBase.swift
//  Ujiacity
//
//  Created by apple on 2016/10/31.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit
import AFNetworking

class NetBase: NSObject {

    static let sharedInstance: NetBase = NetBase()
    func post(url: String, para: [String: Any]) -> AnyPromise {
        //检查网络
        let reachability = Reachability.forInternetConnection()
        if reachability?.currentReachabilityStatus() == NetworkStatus.NotReachable {
            return AnyPromise( Promise(resolvers: { (_ : (AnyObject) -> Void, reject: (Error) -> Void) in
                reject(NetError.NetNotConnectError as Error)
            }))
        }
        reachability?.startNotifier()
        return AFHTTPSessionManager().post(url, parameters: para)
    }
}
