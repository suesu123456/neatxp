//
//  Define.swift
//  Ujiacity
//
//  Created by apple on 2016/11/4.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit

/** aliyun oss key ad url */
let Alioss_AccessID: String = "LTAIXkqyYx7Il70J"
let Alioss_AccessSecret: String = "9KiSMFRpZYRY9c5RLVgbTNIp1HwdEV"
let Alioss_endPoint: String = "http://oss-cn-shanghai.aliyuncs.com"
let Alioss_bucketName: String = "ujiacity"

/** umeng key */
let Umeng_appKey: String = "582a7566b27b0a58740035f1"

/** weixin open platform */
let Umeng_wexinHandler_appKey: String = "wxdc1e388c3822c80b"
let Umeng_wexinHandler_appSecret: String = "3baf1193c85774b3fd9d18447d76cab0"

/// 服务器地址
let BASE_URL       = "http://xxx.xxxxxxx.com/"
/// 第一次启动
let UJCFirstLaunch = "firstLaunch"
/// 是否登录
let isLogin        = "isLogin"
/// 屏幕的宽
let screenWidth    = UIScreen.main.bounds.size.width
/// 屏幕的高
let screenHeight   = UIScreen.main.bounds.size.height
/// iPhone 4
let isIPhone4      = screenHeight == 480 ? true : false
/// iPhone 5
let isIPhone5      = screenHeight == 568 ? true : false
/// iPhone 6
let isIPhone6      = screenHeight == 667 ? true : false
/// iPhone 6P
let isIPhone6P     = screenHeight == 736 ? true : false
/** CGRect 适配使用属性 */
let ScaleX: CGFloat = isIPhone6 ? 1 : screenWidth/375
let ScaleY: CGFloat = isIPhone6 ? 1 : screenHeight/667
//x的对应尺寸->方便文字大小适配
func K_ScaleX(_ x: CGFloat) -> CGFloat {
    var ScaleX: CGFloat = 1
    if !isIPhone6 {
        ScaleX = screenWidth/375
    }
    return x*ScaleX
}
//y的对应尺寸->方便文字大小适配
func K_ScaleY(_ y: CGFloat) -> CGFloat {
    var ScaleY: CGFloat = 1
    if !isIPhone6 {
        ScaleY = screenHeight/667
    }
    return y*ScaleY
}
