//
//  ReSettingNameViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/8/24.
//

import UIKit

class ReSettingNameViewController: UIViewController {

    
    
    let nameSetting = {
        let name = UITextField()
        name.placeholder = UserDefaults.standard.string(forKey: "user")
        name.font = .systemFont(ofSize: 12)
       
        return name
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.fixedColor
        configureNavigationBar()
        configureHierarchy()
        configureLayout()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        nameSetting.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
        

    }
    
    @objc func saveButtonTapped() {
         UserDefaults.standard.setValue(nameSetting.text, forKey: "user")
        MainViewController.user = UserDefaults.standard.string(forKey: "user")
       
    }
//    @objc func backButtonTapped() {
//        dismiss(animated: true)
//    }
    func configureNavigationBar() {

        navigationItem.title = "사용자 이름 설정"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.left"), style: .plain, target: self, action: #selector(backButtonTapped))
//        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
//        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    
    func configureHierarchy() {
        view.addSubview(nameSetting)
    }
    func configureLayout() {
        nameSetting.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
            
        }
    }
    
    
   
}


