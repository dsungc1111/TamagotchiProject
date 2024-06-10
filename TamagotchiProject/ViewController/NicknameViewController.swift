//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/7/24.
//

import UIKit

class NicknameViewController: UIViewController {
    
    let getNickname = {
        let nickname = UITextField()
        nickname.placeholder = " 닉네임을 입력하세요"
//        nickname.layer.borderWidth = 1
        nickname.layer.borderColor = UIColor.black.cgColor
        
        return nickname
    }()
    
    let loginButton = {
        let button = UIButton()
        button.setTitle("유저 입장!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.borderColor.cgColor
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.fixedColor
       
        configureHierarchy()
        configureLayout()
    }
    
    @objc func loginButtonTapped() {
        
        UserDefaults.standard.setValue(getNickname.text, forKey: "user")
        MainViewController.user = UserDefaults.standard.string(forKey: "user")
        
        let vc = MainViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
    
    func configureHierarchy() {
        view.addSubview(getNickname)
        view.addSubview(loginButton)
    }
    
    func configureLayout() {
        getNickname.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(200)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(getNickname.snp.bottom).offset(30)
            make.size.equalTo(100)
        }
    }
    
    
 
}


extension NicknameViewController: UITextFieldDelegate {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
    }
}
