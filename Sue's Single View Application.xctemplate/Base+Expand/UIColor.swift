//
//  UIColor.swift
//  Ujiacity
//
//  Created by apple on 2016/11/4.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit

extension UIColor {
    //调用方式UIColor.red.createImageWidthColor,返回UIImage
    func createImageWithColor() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }
}
