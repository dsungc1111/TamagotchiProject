//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/8/24.
//

import UIKit

class MainViewController: UIViewController {

    static var user = UserDefaults.standard.string(forKey: "user") 
    
     
    let selectedTamagotchi = {
        let image = UIImageView()
       
        return image
    }()
    let selectedLabel = {
        let label = UILabel()
        TamagotchiTableViewCell.configureTamagotchiLabel(label: label, fontSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = UIColor.fixedColor
        return label
    }()
    let tamagotchiLevel = {
        let label = UILabel()
        label.text = "LV1﹒밥알 0개﹒물방울 0개 "
        label.textColor = .darkGray
        return label
    }()
    
    let getRiceTextField = {
        let rice = UITextField()
        rice.textAlignment = .center
        rice.placeholder = "밥주세용"
        
        return rice
    }()
    let getWaterTextField = {
        let water = UITextField()
        water.textAlignment = .center
        water.placeholder = "물주세용"
        return water
    }()
    lazy var getRiceButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        self.configureButton(button: button, title: "밥먹기")
        return button
    }()
    lazy var getWaterButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        self.configureButton(button: button, title: "물먹기")
        return button
    }()
    
    
    func configureButton(button: UIButton, title: String) {
        button.tintColor = .darkGray
        button.setTitle(title, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
    }
    
    
    // 레벨, 물방울, 밥먹기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
        view.backgroundColor = UIColor.fixedColor
        
       
        
        print("main :",#function)
        navigationItem.title = "\(MainViewController.user!)님의 다마고치"
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
       
        
        
        configureHierarchy()
        configureLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(MainViewController.user!)님의 다마고치"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        getRiceTextField.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
        getWaterTextField.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
    }
    
    @objc func settingButtonTapped() {
        let vc = SettingViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    
    
    func setValue() {
        let user = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
    
        switch user {
        case 1:
            selectedTamagotchi.image = UIImage._1_6
            selectedLabel.text = TamagotchiTableViewCell.Character.cactus
        case 2:
            selectedTamagotchi.image = UIImage._2_6
            selectedLabel.text = TamagotchiTableViewCell.Character.sun
        case 3:
            selectedTamagotchi.image = UIImage._3_6
            selectedLabel.text = TamagotchiTableViewCell.Character.star
        default:
            break
        }
    }
    
    func configureHierarchy() {
        view.addSubview(selectedTamagotchi)
        view.addSubview(selectedLabel)
        view.addSubview(tamagotchiLevel)
        view.addSubview(getRiceTextField)
        view.addSubview(getWaterTextField)
        view.addSubview(getRiceButton)
        view.addSubview(getWaterButton)
    }
    func configureLayout() {
        selectedTamagotchi.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(160)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(200)
        }
        selectedLabel.snp.makeConstraints { make in
            make.top.equalTo(selectedTamagotchi.snp.bottom).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
        tamagotchiLevel.snp.makeConstraints { make in
            make.top.equalTo(selectedLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        getRiceTextField.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiLevel.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        getWaterTextField.snp.makeConstraints { make in
            make.top.equalTo(getRiceTextField.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        getRiceButton.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiLevel.snp.bottom).offset(30)
            make.leading.equalTo(getRiceTextField.snp.trailing).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        getWaterButton.snp.makeConstraints { make in
            make.top.equalTo(getRiceButton.snp.bottom).offset(10)
            make.leading.equalTo(getWaterTextField.snp.trailing).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
    }
}



