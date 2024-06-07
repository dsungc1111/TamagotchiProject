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


extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}


extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
