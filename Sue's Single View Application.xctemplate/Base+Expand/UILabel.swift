//
//  UILabel.swift
//  Ujiacity
//
//  Created by apple on 2016/11/28.
//  Copyright © 2016年 ujiacity. All rights reserved.
//
import Foundation

extension UILabel {
    func setString(str: String, size: CGFloat) {
        self.font = UIFont.systemFont(ofSize: size)
        self.numberOfLines = 0
        self.text = str
        self.sizeToFit()
    }
    func setHtmlString(str: String, size: CGFloat) {
        self.font = UIFont.systemFont(ofSize: size)
        self.numberOfLines = 0
        let attrStr = try? NSAttributedString(data: str.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        self.attributedText = attrStr
        self.sizeToFit()
        self.textColor = UIColor(hexString: "#555555")
    }
    func setLabLineSpacing(lineSpace: CGFloat) {
        let attributedString = NSMutableAttributedString(string: self.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        let length =  NSString(string: self.text == nil ? "" : self.text!).length
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, length) )
        self.attributedText = attributedString
        self.sizeToFit()
    }

}
