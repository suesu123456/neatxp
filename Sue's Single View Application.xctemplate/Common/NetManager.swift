//
//  NetManager.swift
//  Ujiacity
//
//  Created by apple on 2016/11/1.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit

class NetManager: NSObject {
    static let sharedInstance: NetManager = NetManager()
    //登录
    func login ( para: [String: Any]) -> AnyPromise {
        return NetBase.sharedInstance.post(url: "http://192.168.2.182:8181/login", para: para)
    }
}
