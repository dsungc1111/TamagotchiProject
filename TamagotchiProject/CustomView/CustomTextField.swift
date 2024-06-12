//
//  getInfoTextField.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/12/24.
//

import UIKit


class feedingTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp()  {
        textAlignment = .center
        keyboardType = .numberPad
    }
    
}
