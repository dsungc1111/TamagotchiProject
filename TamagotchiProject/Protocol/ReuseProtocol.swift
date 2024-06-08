//
//  ReuseProtocol.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/7/24.
//

import UIKit


protocol ReuseProtocol {
    static var identifier: String { get }
}


extension UIViewController: ReuseProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


extension UITableViewCell: ReuseProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


protocol MainThemeColorProtocol {
    static var fixedColor:UIColor { get }
}
extension UIColor: MainThemeColorProtocol {
    static var fixedColor: UIColor {
        return UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
    }
}

protocol BorderColorProtocol {
    static var borderColor:UIColor { get }
}

extension UIColor: BorderColorProtocol {
    static var borderColor: UIColor {
        return UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    
}
