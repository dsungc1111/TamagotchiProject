//
//  CustomButton.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/12/24.
//

import UIKit


class configureButton: UIButton {
    
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        tintColor = .darkGray
        setTitleColor(.darkGray, for: .normal)
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
    }
    
}
