//
//  String.swift
//  Ujiacity
//
//  Created by apple on 2016/11/28.
//  Copyright © 2016年 ujiacity. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func getHeightByWidth(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        let  attributes = [NSFontAttributeName:font,
                           NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size.height
    }
}
extension String {
    public func start(with prefix: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return lowercased().hasPrefix(prefix.lowercased())
        }
        return hasPrefix(prefix)
    }
    // SwifterSwift: Check if string is https URL.
    public var isHttpsUrl: Bool {
        guard start(with: "https://".lowercased()) else {
            return false
        }
        return URL(string: self) != nil
    }
    // SwifterSwift: Check if string is http URL.
    public var isHttpUrl: Bool {
        guard start(with: "http://".lowercased()) else {
            return false
        }
        return URL(string: self) != nil
    }
    public func replacing(_ substring: String, with newString: String) -> String {
        return replacingOccurrences(of: substring, with: newString)
    }
}
