//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/8/24.
//

import UIKit

struct Growth {
    var rice: Double = 0
    var waterdrop: Double = 0
    
    var total: Double {
        return (rice/5) + waterdrop/2
    }
}


class MainViewController: UIViewController {

    static var user = UserDefaults.standard.string(forKey: "user")
    
    var feedingCactus : Growth = Growth()
    var feedingSun: Growth = Growth()
    var feedingStar: Growth = Growth()
    var riceTotalOfCactus = 0.0
    var waterTotalOfCactus = 0.0
    var riceTotalOfSun = 0.0
    var waterTotalOfSun = 0.0
    var riceTotalOfStar = 0.0
    var waterTotalOfStar = 0.0
    var level = 1
    
    let selectedTamagotchi = {
        let view = UIImageView()
        let seleted = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
        
        switch seleted{
        case 1:
            view.image = UIImage._1_1
        case 2:
            view.image = UIImage._2_1
        case 3:
            view.image = UIImage._3_1
        default:
            break
        }
        return view
    }()
    let selectedLabel = {
        let label = UILabel()
        let seletedTamagotchi = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
        TamagotchiTableViewCell.configureTamagotchiLabel(label: label, fontSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = UIColor.fixedColor
        
        switch seletedTamagotchi {
        case 1:
            label.text = SelectViewController.Character.cactus.rawValue
        case 2:
            label.text = SelectViewController.Character.sun.rawValue
        case 3:
            label.text = SelectViewController.Character.star.rawValue
        default:
            break
        }
        
        
        
        
        
        
        
        
        
        
        
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
    
    
    // 레벨, 물방울, 밥먹기
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.fixedColor
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
    
    @objc func getRiceButtonTapped() {
        let seletedTamagotchi = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
        //선인장
        if seletedTamagotchi == 1 {
            growthOfCactusWithRice()
            let lv = getLevelOfCactus(rice: riceTotalOfCactus, water: waterTotalOfCactus)
            tamagotchiLevel.text = "Lv\(lv) 밥알\(Int(riceTotalOfCactus))개 물방울\(Int(waterTotalOfCactus))개"
        } else if seletedTamagotchi == 2 { // 태양
            
            growthOfSunWithRice()
            let lv = getLevelOfSun(rice: riceTotalOfSun, water: waterTotalOfSun)
            tamagotchiLevel.text = "Lv\(lv) 밥알\(Int(riceTotalOfSun))개 물방울\(Int(waterTotalOfSun))개"
        } else { // 스타
            growthOfStarWithRice()
            getLevelOfStar(rice: riceTotalOfStar, water: waterTotalOfStar)
            tamagotchiLevel.text = "Lv\(level) 밥알\(Int(riceTotalOfStar))개 물방울\(Int(waterTotalOfStar))개"
            
        }
        
    }
    @objc func getWaterButtonTapped() {
        let aa = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
        print(aa)
        //선인장
        if aa == 1 {
            growthOfCactusWithWater()
            let aa = getLevelOfCactus(rice: riceTotalOfCactus, water: waterTotalOfCactus)
            tamagotchiLevel.text = "Lv\(aa) 밥알\(Int(riceTotalOfCactus))개 물방울\(Int(waterTotalOfCactus))개"
        } else if aa == 2 {
            // 태양
            growthOfSunWithWater()
            let lv = getLevelOfSun(rice: riceTotalOfSun, water: waterTotalOfSun)
            tamagotchiLevel.text = "Lv\(lv) 밥알\(Int(riceTotalOfSun))개 물방울\(Int(waterTotalOfSun))개"
            
        } else if aa == 3 {
            // 스타
            growthOfStarWithWater()
            getLevelOfStar(rice: riceTotalOfStar, water: waterTotalOfStar)
            tamagotchiLevel.text = "Lv\(level) 밥알\(Int(riceTotalOfStar))개 물방울\(Int(waterTotalOfStar))개"
        }
        
    }
    
    func growthOfCactusWithRice() {
        // 숫자가 있을 때 없을 때
        if let rice = getRiceTextField.text {
            riceTotalOfCactus += Double(rice) ?? 1.0
        }
    }
    func growthOfSunWithRice() {
        if let rice = getRiceTextField.text {
            riceTotalOfSun += Double(rice) ?? 1.0
        }
    }
    func growthOfStarWithRice() {
        if let rice = getRiceTextField.text {
            riceTotalOfStar += Double(rice) ?? 1.0
        }
    }
    func growthOfCactusWithWater() {
        if let water = getWaterTextField.text {
            waterTotalOfCactus += Double(water) ?? 1.0
        }
    }
    func growthOfSunWithWater() {
        if let water = getWaterTextField.text {
            waterTotalOfSun += Double(water) ?? 1.0
        }
    }
    func growthOfStarWithWater() {
        if let water = getWaterTextField.text {
            waterTotalOfStar += Double(water) ?? 1.0
        }
    }
    
    
    
    
    
    func getLevelOfCactus(rice: Double, water: Double) -> Int {
        let total = Int(rice/5 + water/2)
       
        switch total {
        case 0..<20:
            selectedTamagotchi.image = UIImage._1_1
            level = 1
            
        case 20..<30:
            selectedTamagotchi.image = UIImage._1_2
            level = 3
        case 30..<40:
            selectedTamagotchi.image = UIImage._1_3
            level = 4
        case 40..<50:
            selectedTamagotchi.image = UIImage._1_4
            level = 4
        case 50..<60:
            selectedTamagotchi.image = UIImage._1_5
            level = 5
        case 60..<70:
            selectedTamagotchi.image = UIImage._1_6
            level = 6
        case 70..<80:
            selectedTamagotchi.image = UIImage._1_7
            level = 7
        case 80..<90:
            selectedTamagotchi.image = UIImage._1_8
            level = 8
        case 90..<100:
            selectedTamagotchi.image = UIImage._1_9
            level = 9
        case 100...:
            selectedTamagotchi.image = UIImage._1_9
            level = 10
        default:
            break
        }
        
        return level
        
    }
    
    
    func getLevelOfSun(rice: Double, water: Double) -> Int {
        let total = Int(rice/5 + water/2)
       
        switch total {
        case 0..<20:
            selectedTamagotchi.image = UIImage._2_1
            level = 1
            
        case 20..<30:
            selectedTamagotchi.image = UIImage._2_2
            level = 3
        case 30..<40:
            selectedTamagotchi.image = UIImage._2_3
            level = 4
        case 40..<50:
            selectedTamagotchi.image = UIImage._2_4
            level = 4
        case 50..<60:
            selectedTamagotchi.image = UIImage._2_5
            level = 5
        case 60..<70:
            selectedTamagotchi.image = UIImage._2_6
            level = 6
        case 70..<80:
            selectedTamagotchi.image = UIImage._2_7
            level = 7
        case 80..<90:
            selectedTamagotchi.image = UIImage._2_8
            level = 8
        case 90..<100:
            selectedTamagotchi.image = UIImage._2_9
            level = 9
        case 100...:
            selectedTamagotchi.image = UIImage._2_9
            level = 10
        default:
            break
        }
        
        return level
        
    }
    
    func getLevelOfStar(rice: Double, water: Double) {
        let total = Int(rice/5 + water/2)
       
        switch total {
        case 0..<20:
            selectedTamagotchi.image = UIImage._3_1
            level = 1
            
        case 20..<30:
            selectedTamagotchi.image = UIImage._3_2
            level = 3
        case 30..<40:
            selectedTamagotchi.image = UIImage._3_3
            level = 4
        case 40..<50:
            selectedTamagotchi.image = UIImage._3_4
            level = 4
        case 50..<60:
            selectedTamagotchi.image = UIImage._3_5
            level = 5
        case 60..<70:
            selectedTamagotchi.image = UIImage._3_6
            level = 6
        case 70..<80:
            selectedTamagotchi.image = UIImage._3_7
            level = 7
        case 80..<90:
            selectedTamagotchi.image = UIImage._3_8
            level = 8
        case 90..<100:
            selectedTamagotchi.image = UIImage._3_9
            level = 9
        case 100...:
            selectedTamagotchi.image = UIImage._3_9
            level = 10
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




/*
 switch feeding.total {
 case 0..<20:
     selectedTamagotchi.image = UIImage._1_1
     tamagotchiLevel.text = "LV1﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 20..<30:
     selectedTamagotchi.image = UIImage._1_2
     tamagotchiLevel.text = "LV2﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 30..<40:
     selectedTamagotchi.image = UIImage._1_3
     tamagotchiLevel.text = "LV3﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 40..<50:
     selectedTamagotchi.image = UIImage._1_4
     tamagotchiLevel.text = "LV4﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 50..<60:
     selectedTamagotchi.image = UIImage._1_5
     tamagotchiLevel.text = "LV5﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 60..<70:
     selectedTamagotchi.image = UIImage._1_6
     tamagotchiLevel.text = "LV6﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 70..<80:
     selectedTamagotchi.image = UIImage._1_7
     tamagotchiLevel.text = "LV7﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 80..<90:
     selectedTamagotchi.image = UIImage._1_8
     tamagotchiLevel.text = "LV8﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 90..<100:
     selectedTamagotchi.image = UIImage._1_9
     tamagotchiLevel.text = "LV9﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 case 100...:
     selectedTamagotchi.image = UIImage._1_9
     tamagotchiLevel.text = "LV10﹒밥알 \(feeding.rice)개﹒물방울 \(feeding.waterdrop)개 "
 default:
     break
 }
 */
