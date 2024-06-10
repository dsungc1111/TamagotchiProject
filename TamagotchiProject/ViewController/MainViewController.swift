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
    var lvCac = 1
    var lvStar = 1
    var lvSun = 1
    
    let selectedTamagotchi = {
        let view = UIImageView()
        let seleted = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
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
    
    
    // 레벨, 물방울, 밥먹기
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.fixedColor
        navigationItem.title = "\(String(describing: MainViewController.user))님의 다마고치"
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
       
        configureHierarchy()
        configureLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(MainViewController.user!)님의 다마고치"
        lvCac = UserDefaults.standard.integer(forKey: "lvCac")
        riceTotalOfCactus = UserDefaults.standard.double(forKey: "riceCactus")
        waterTotalOfCactus = UserDefaults.standard.double(forKey: "waterCactus")
        
        lvSun = UserDefaults.standard.integer(forKey: "lvSun")
        riceTotalOfSun = UserDefaults.standard.double(forKey: "riceSun")
        waterTotalOfSun = UserDefaults.standard.double(forKey: "waterSun")
        
        lvStar = UserDefaults.standard.integer(forKey: "lvStar")
        riceTotalOfStar = UserDefaults.standard.double(forKey: "riceStar")
        waterTotalOfStar = UserDefaults.standard.double(forKey: "waterStar")
        
        getWaterButtonTapped()
        getRiceButtonTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getRiceTextField.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
        getWaterTextField.layer.addBorder([.bottom], color: UIColor.darkGray, width: 1)
    }
    
    @objc func settingButtonTapped() {
        let vc = SettingViewController()
        // let nav = UINavigationController(rootViewController: vc)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.popViewController(animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func getRiceButtonTapped() {
        let seletedTamagotchi = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
        //선인장
        if seletedTamagotchi == 1 {
            growthOfCactusWithRice()
            lvCac = getLevelOfCactus(rice: riceTotalOfCactus, water: waterTotalOfCactus)
            tamagotchiLevel.text = "Lv\(lvCac) 밥알\(Int(riceTotalOfCactus))개 물방울\(Int(waterTotalOfCactus))개"
        } else if seletedTamagotchi == 2 { // 태양
            
            growthOfSunWithRice()
            lvSun = getLevelOfSun(rice: riceTotalOfSun, water: waterTotalOfSun)
            tamagotchiLevel.text = "Lv\(lvSun) 밥알\(Int(riceTotalOfSun))개 물방울\(Int(waterTotalOfSun))개"
        } else { // 스타
            growthOfStarWithRice()
             lvStar = getLevelOfStar(rice: riceTotalOfStar, water: waterTotalOfStar)
            tamagotchiLevel.text = "Lv\(lvStar) 밥알\(Int(riceTotalOfStar))개 물방울\(Int(waterTotalOfStar))개"
            
        }
        UserDefaults.standard.setValue(lvCac, forKey: "lvCac")
        UserDefaults.standard.setValue(riceTotalOfCactus, forKey: "riceCactus")
        UserDefaults.standard.setValue(lvSun, forKey: "lvSun")
        UserDefaults.standard.setValue(riceTotalOfSun, forKey: "riceSun")
        UserDefaults.standard.setValue(lvStar, forKey: "lvStar")
        UserDefaults.standard.setValue(riceTotalOfStar, forKey: "riceStar")
    }
    @objc func getWaterButtonTapped() {
        let image = UserDefaults.standard.integer(forKey: SelectViewController.tamagotchi)
        //선인장
        if image == 1 {
            growthOfCactusWithWater()
            lvCac = getLevelOfCactus(rice: riceTotalOfCactus, water: waterTotalOfCactus)
            tamagotchiLevel.text = "Lv\(lvCac) 밥알\(Int(riceTotalOfCactus))개 물방울\(Int(waterTotalOfCactus))개"
        } else if image == 2 {
            // 태양
            growthOfSunWithWater()
            lvSun = getLevelOfSun(rice: riceTotalOfSun, water: waterTotalOfSun)
            tamagotchiLevel.text = "Lv\(lvSun) 밥알\(Int(riceTotalOfSun))개 물방울\(Int(waterTotalOfSun))개"
            
        } else if image == 3 {
            // 스타
            growthOfStarWithWater()
            lvStar = getLevelOfStar(rice: riceTotalOfStar, water: waterTotalOfStar)
            tamagotchiLevel.text = "Lv\(lvStar) 밥알\(Int(riceTotalOfStar))개 물방울\(Int(waterTotalOfStar))개"
        }
        UserDefaults.standard.setValue(lvCac, forKey: "lvCac")
        UserDefaults.standard.setValue(waterTotalOfCactus, forKey: "waterCactus")
        UserDefaults.standard.setValue(lvSun, forKey: "lvSun")
        UserDefaults.standard.setValue(waterTotalOfSun, forKey: "waterSun")
        UserDefaults.standard.setValue(lvStar, forKey: "lvStar")
        UserDefaults.standard.setValue(waterTotalOfStar, forKey: "waterStar")
        
        
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
            lvCac = 1
            
        case 20..<30:
            selectedTamagotchi.image = UIImage._1_2
            lvCac = 3
        case 30..<40:
            selectedTamagotchi.image = UIImage._1_3
            lvCac = 4
        case 40..<50:
            selectedTamagotchi.image = UIImage._1_4
            lvCac = 4
        case 50..<60:
            selectedTamagotchi.image = UIImage._1_5
            lvCac = 5
        case 60..<70:
            selectedTamagotchi.image = UIImage._1_6
            lvCac = 6
        case 70..<80:
            selectedTamagotchi.image = UIImage._1_7
            lvCac = 7
        case 80..<90:
            selectedTamagotchi.image = UIImage._1_8
            lvCac = 8
        case 90..<100:
            selectedTamagotchi.image = UIImage._1_9
            lvCac = 9
        case 100...:
            selectedTamagotchi.image = UIImage._1_9
            lvCac = 10
        default:
            break
        }
        
        return lvCac
        
    }
    
    
    func getLevelOfSun(rice: Double, water: Double) -> Int {
        let total = Int(rice/5 + water/2)
       
        switch total {
        case 0..<20:
            selectedTamagotchi.image = UIImage._2_1
            lvSun = 1
            
        case 20..<30:
            selectedTamagotchi.image = UIImage._2_2
            lvSun = 3
        case 30..<40:
            selectedTamagotchi.image = UIImage._2_3
            lvSun = 4
        case 40..<50:
            selectedTamagotchi.image = UIImage._2_4
            lvSun = 4
        case 50..<60:
            selectedTamagotchi.image = UIImage._2_5
            lvSun = 5
        case 60..<70:
            selectedTamagotchi.image = UIImage._2_6
            lvSun = 6
        case 70..<80:
            selectedTamagotchi.image = UIImage._2_7
            lvSun = 7
        case 80..<90:
            selectedTamagotchi.image = UIImage._2_8
            lvCac = 8
        case 90..<100:
            selectedTamagotchi.image = UIImage._2_9
            lvSun = 9
        case 100...:
            selectedTamagotchi.image = UIImage._2_9
            lvSun = 10
        default:
            break
        }
        
        return lvCac
        
    }
    
    func getLevelOfStar(rice: Double, water: Double) -> Int {
        let total = Int(rice/5 + water/2)
        switch total {
        case 0..<20:
            selectedTamagotchi.image = UIImage._3_1
            lvStar = 1
            
        case 20..<30:
            selectedTamagotchi.image = UIImage._3_2
            lvStar = 3
        case 30..<40:
            selectedTamagotchi.image = UIImage._3_3
            lvStar = 4
        case 40..<50:
            selectedTamagotchi.image = UIImage._3_4
            lvStar = 4
        case 50..<60:
            selectedTamagotchi.image = UIImage._3_5
            lvStar = 5
        case 60..<70:
            selectedTamagotchi.image = UIImage._3_6
            lvStar = 6
        case 70..<80:
            selectedTamagotchi.image = UIImage._3_7
            lvStar = 7
        case 80..<90:
            selectedTamagotchi.image = UIImage._3_8
            lvStar = 8
        case 90..<100:
            selectedTamagotchi.image = UIImage._3_9
            lvCac = 9
        case 100...:
            selectedTamagotchi.image = UIImage._3_9
            lvStar = 10
        default:
            break
        }
        return lvStar
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





/*
 물,
 
 저장해야할 것
 캐릭터 : 선인장, 선, 스타
 물 : 선인장 물, 선 물, 스타물
 밥 : 선인장 밥, 선밥, 스타밥
 
 - 다마고치 변경시,
 캐릭터 변경(완료)
 캐릭터마다 물 밥 그대로
 ---------------------------완료
 - 데이터 초기화시
 체인지, 다마고찌 물 밥 캐릭터 다 초기화
 
 
 */
