//
//  UIView.swift
//  Ujiacity
//
//  Created by sue on 2016/11/7.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    //发光动画
    func startPulseWith(color: UIColor, offset: CGSize, frequency: CGFloat, borderColor: UIColor) {
        self.layer.setShadow(opacity: 0.9, color: color, radius: 3, offset: offset)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        //animation
        let anim = CABasicAnimation(keyPath: "shadowOpacity")
        anim.fromValue = 0.9
        anim.toValue = 0.2
        anim.duration = CFTimeInterval(frequency)
        anim.autoreverses = true
        anim.repeatCount = Float(Int32.max)
        self.layer.add(anim, forKey: "Pulse")
    }
    /**
     *  加载原型Button动画
     *  @param
     *  @return
     */
    func loadingAnimate() -> UIImage {
       UIGraphicsBeginImageContextWithOptions(CGSize(width:200, height:200), false, 0) //(CGSizeMake(100,100), NO, 0);
        let path: UIBezierPath = UIBezierPath()
        path.addArc(withCenter: self.center, radius: 100, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        path.lineWidth = 2
        UIColor.gray.setStroke()
        UIColor.red.setFill()
        path.stroke()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    /**
     *  首页-添加边框
     *  @param
     *  @return
     */
    func setBorder(leftHeight height: CGFloat, color: UIColor, borderWidth: CGFloat) {
            //left
            let layer = CALayer()
            layer.frame = CGRect(x:0, y:self.frame.size.height-height, width: borderWidth, height: height)
            layer.backgroundColor = color.cgColor
            self.layer.addSublayer(layer)
            //bottom
            let layer1 = CALayer()
            layer1.frame = CGRect(x:0, y:self.frame.size.height-borderWidth, width: self.frame.size.width, height: borderWidth)
            layer1.backgroundColor = color.cgColor
            self.layer.addSublayer(layer1)
            //right
            let layer2 = CALayer()
            layer2.frame = CGRect(x:self.frame.size.width-borderWidth, y:self.frame.size.height-height, width: borderWidth, height: height)
            layer2.backgroundColor = color.cgColor
            self.layer.addSublayer(layer2)
    }
}

extension CALayer {
    /**
     *  阴影设置
     *  @param
     *  @return
     */
    func setShadow(opacity: Float, color: UIColor, radius: CGFloat, offset: CGSize) {
        self.shadowColor = color.cgColor
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.shadowRadius = radius
    }

}
