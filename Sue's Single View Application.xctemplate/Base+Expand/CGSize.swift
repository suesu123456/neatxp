//
//  CGSize.swift
//  Ujiacity
//
//  Created by apple on 2016/12/2.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit

extension CGSize {
    public init(widthX: CGFloat, heightX: CGFloat) {
        self.init(width: widthX*ScaleX, height: heightX*ScaleY)
    }
}
