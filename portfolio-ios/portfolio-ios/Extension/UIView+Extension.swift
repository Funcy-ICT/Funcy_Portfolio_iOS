//
//  UIView+Extension.swift
//  portfolio-ios
//
//  Created by 工藤 海斗 on 2022/04/03.
//

import UIKit

extension UIView {
    // 以下の設定をすることでStoryboard及びXibでプロパティの変更が可能になる
    
    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    // 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 角丸の大きさ
    @IBInspectable var cornerRound: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
