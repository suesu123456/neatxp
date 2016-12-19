//
//  CGPoint.swift
//  Ujiacity
//
//  Created by apple on 2016/11/29.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import Foundation
extension CGPoint {
    public init(xx: CGFloat, yy: CGFloat) {
         self.init(x: xx*ScaleX, y: yy*ScaleY)
    }
}
