//
//  CGRect.swift
//  Ujiacity
//
//  Created by apple on 2016/11/17.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import Foundation

extension CGRect {
    // **************************************机型横屏适配*******************************************//
    //坐标改变、大小改变 调用CGRect(xx: 0, yy: 0, widthX: 100, heightY:100)
    public init(xx: CGFloat, yy: CGFloat, widthX: CGFloat, heightY: CGFloat) {
        self.init(x: xx*ScaleX, y: yy*ScaleY, width: widthX*ScaleX, height: heightY*ScaleY)
    }
    //坐标改变、大小不变 调用CGRect(xx: 0, yy: 0, 100, 100),下划线表示调用时可以忽略
    public init(xx: CGFloat, yy: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        var ScaleX: CGFloat = 1
        var ScaleY: CGFloat = 1
        if !isIPhone6 {
            ScaleX = screenWidth/375
            ScaleY = screenHeight/667
        }
       self.init(x: xx*ScaleX, y: yy*ScaleY, width: width, height: height)
    }
     //坐标不变、大小改变 调用CGRect(0, 0, widthX: 100, heightY:100)
    public init(_ x: CGFloat, _ y: CGFloat, widthX: CGFloat, heightY: CGFloat) {
        var ScaleX: CGFloat = 1
        var ScaleY: CGFloat = 1
        if !isIPhone6 {
            ScaleX = screenWidth/375
            ScaleY = screenHeight/667
        }
        self.init(x: x, y: y, width: widthX*ScaleX, height: heightY*ScaleY)
    }
}
