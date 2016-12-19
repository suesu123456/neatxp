//
//  UIButton.swift
//  Ujiacity
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit

extension UIButton {
    /**
     *  短时间内多次重复点击按钮造成的响应错误
     *  @param
     *  @return
     */
    func antiMultiplyTouch(delay: TimeInterval, closure:()->()) {
//        self.isExclusiveTouch 
//        self.isUserInteractionEnabled = false
//        dispatch_after(
//            dispatch_time(
//                DISPATCH_TIME_NOW,
//                Int64(delay * Double(NSEC_PER_SEC))
//            ),
//            dispatch_get_main_queue(), {
//                self.userInteractionEnabled = true
//                closure()
//        })
    }
}
