//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/8/24.
//

import UIKit



class MainViewController: UIViewController {
    
    
 
    let selectedTamagotchi = {
        let view = UIImageView()
        let seleted = UserDefaults.standard.integer(forKey: Variable.tamagotchi)
        return view
    }()
    let selectedLabel = {
        let label = UILabel()
        let seletedTamagotchi = UserDefaults.standard.integer(forKey: Variable.tamagotchi)
        TamagotchiTableViewCell.configureTamagotchiLabel(label: label, fontSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = UIColor.fixedColor
        
        switch seletedTamagotchi {
        case 1:
            label.text = Constant.Character.cactus.rawValue
        case 2:
            label.text = Constant.Character.star.rawValue
        case 3:
            label.text = Constant.Character.cactus.rawValue
        default:
            break
        }
        return label
    }()
    let tamagotchiLevel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    
    let getRiceTextField = {
        let rice = UITextField()
        rice.textAlignment = .center
        rice.placeholder = "밥주세용"
        rice.keyboardType = .numberPad
        return rice
    }()
    let getWaterTextField = {
        let water = UITextField()
        water.textAlignment = .center
        water.placeholder = "물주세용"
        water.keyboardType = .numberPad
        return water
    }()
    
    
    lazy var getRiceButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        self.configureButton(button: button, title: "밥먹기")
        button.addTarget(self, action: #selector(getRiceButtonTapped), for: .touchUpInside)
        return button
    }()
    lazy var getWaterButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        self.configureButton(button: button, title: "물먹기")
        button.addTarget(self, action: #selector(getWaterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    func configureButton(button: UIButton, title: String) {
        button.tintColor = .darkGray
        button.setTitle(title, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.fixedColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        configureHierarchy()
        configureLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(Variable.user)님의 다마고치"
        getWaterButtonTapped()
        getRiceButtonTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getRiceTextField.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
        getWaterTextField.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
    }
    
    @objc func settingButtonTapped() {
        let vc = SettingViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func getRiceButtonTapped() {
        
        if Variable.pickedTama == 1 {
            let growRice = amountOfRice(riceTotal: Variable.riceTotalOfCactus)
            Variable.riceTotalOfCactus = growRice

            Variable.lvCac = getLevelImage(tamagotchi: Variable.pickedTama, rice: Variable.riceTotalOfCactus, water: Variable.waterTotalOfCactus)
            tamagotchiLevel.text = "Lv\(Variable.lvCac) "
        } else if Variable.pickedTama == 2 {
            let growRice = amountOfRice(riceTotal: Variable.riceTotalOfSun)
            Variable.riceTotalOfSun = growRice
            Variable.lvSun = getLevelImage(tamagotchi: Variable.pickedTama, rice: Variable.riceTotalOfSun, water: Variable.waterTotalOfSun)
            tamagotchiLevel.text = "Lv\(Variable.lvSun) "
        } else if Variable.pickedTama == 3 {
            let growRice = amountOfRice(riceTotal: Variable.riceTotalOfStar)
            Variable.riceTotalOfStar = growRice
            Variable.lvStar = getLevelImage(tamagotchi: Variable.pickedTama, rice: Variable.riceTotalOfStar, water: Variable.waterTotalOfStar)
            tamagotchiLevel.text = "Lv\(Variable.lvStar) "
            
        }
        
        tamagotchiLevel.text! += "밥알\(Int(Variable.riceTotalOfCactus))개 물방울\(Int(Variable.waterTotalOfCactus))개"
    }
    @objc func getWaterButtonTapped() {
        if Variable.pickedTama == 1 {

            let growWater = amountOfWater(waterTotal: Variable.waterTotalOfCactus)
            Variable.waterTotalOfCactus = growWater
            Variable.lvCac = getLevelImage(tamagotchi: Variable.pickedTama, rice: Variable.riceTotalOfCactus, water: Variable.waterTotalOfCactus)
            tamagotchiLevel.text = "Lv\(Variable.lvCac) 밥알\(Int(Variable.riceTotalOfCactus))개 물방울\(Int(Variable.waterTotalOfCactus))개"
        } else if Variable.pickedTama == 2 {
            let growWater = amountOfWater(waterTotal: Variable.waterTotalOfSun)
            Variable.waterTotalOfSun = growWater
            Variable.lvSun = getLevelImage(tamagotchi: Variable.pickedTama, rice: Variable.riceTotalOfSun, water: Variable.waterTotalOfSun)
            tamagotchiLevel.text = "Lv\(Variable.lvSun) 밥알\(Int(Variable.riceTotalOfSun))개 물방울\(Int(Variable.waterTotalOfSun))개"
            
        } else if Variable.pickedTama == 3 {
            let growWater = amountOfWater(waterTotal: Variable.waterTotalOfStar)
            Variable.waterTotalOfStar = growWater
            Variable.lvStar = getLevelImage(tamagotchi: Variable.pickedTama, rice: Variable.riceTotalOfStar, water: Variable.waterTotalOfStar)
            tamagotchiLevel.text = "Lv\(Variable.lvStar) 밥알\(Int(Variable.riceTotalOfStar))개 물방울\(Int(Variable.waterTotalOfStar))개"
        }
    }
    
    func amountOfRice(riceTotal: Double) -> Double  {
        var total = riceTotal
        if let rice = getRiceTextField.text {
            total = riceTotal + (Double(rice) ?? 1.0)
        }
        return total
    }
    
    func amountOfWater(waterTotal: Double) -> Double  {
        var total = waterTotal
        if let water = getWaterTextField.text {
            total = waterTotal + (Double(water) ?? 1.0)
        }
        return total
    }
    
    func getLevelImage(tamagotchi: Int, rice: Double, water: Double) -> Int {
        let total = Int(rice/5 + water/2)
        var level = 0
        switch total {
        case 0..<20:
            level = 1
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
            
        case 20..<30:
            level = 2
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
           
        case 30..<40:
            level = 3
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 40..<50:
            level = 4
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 50..<60:
            level = 5
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 60..<70:
            level = 6
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 70..<80:
            level = 7
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 80..<90:
            level = 8
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 90..<100:
            level = 9
            let img = UIImage(named: "\(tamagotchi)-\(level)")
            selectedTamagotchi.image = img
        case 100...:
            level = 10
            let img = UIImage(named: "\(tamagotchi)-\(level-1)")
            selectedTamagotchi.image = img
        default:
            break
        }
        
        return level
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


extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
