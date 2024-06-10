//
//  SettingViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/8/24.
//

import UIKit

class SettingViewController: UIViewController {
    
    static var smallname: String = " "
    
    let tableView = UITableView()
    
    let alertButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.isHidden = true
        return button
    }()
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.fixedColor
       
        configureNavigationBar()
        configureTableView()
        configureHierarchy()
        configureLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.backgroundColor = .clear
    }
    
    
    func configureNavigationBar() {
        navigationItem.title = "설정"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    
    func configureHierarchy() {
        view.addSubview(tableView)
        view.addSubview(alertButton)
    }
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.verticalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        alertButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(250)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.height.equalTo(140)
        }
    }
    
    
    @objc func settingButtonTapped(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            let vc = ReSettingNameViewController()
            navigationController?.pushViewController(vc, animated: true)
           
        case 2:
            let vc = SelectViewController()
            vc.navigationItem.title = "다마고치 변경하기"
            navigationController?.pushViewController(vc, animated: true)
            SelectViewController.changeTamaCount += 1
        case 3:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)
            
            let yesButton = UIAlertAction(title: "yes", style: .default) {_ in 
                self.dataReset()
                self.resetPage()
            }
            let cancelButton = UIAlertAction(title: "cancel", style: .cancel)
            
            alert.addAction(cancelButton)
            alert.addAction(yesButton)
            
            present(alert, animated: true)
            
        default:
            break
        }
    }
  
    func resetPage() {
        let vc = UINavigationController(rootViewController: SelectViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func dataReset() {
        UserDefaults.standard.setValue(0, forKey: SelectViewController.tamagotchi)
         SelectViewController.changeTamaCount = 0
        UserDefaults.standard.setValue("", forKey: "user")
        UserDefaults.standard.setValue(1, forKey: "lvCac")
        UserDefaults.standard.setValue(0, forKey: "waterCactus")
        UserDefaults.standard.setValue(1, forKey: "lvSun")
        UserDefaults.standard.setValue(0, forKey: "waterSun")
        UserDefaults.standard.setValue(1, forKey: "lvStar")
        UserDefaults.standard.setValue(0, forKey: "waterStar")
        UserDefaults.standard.setValue(0, forKey: "riceCactus")
        UserDefaults.standard.setValue(0, forKey: "riceSun")
        UserDefaults.standard.setValue(0, forKey: "riceStar")
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else { return SettingTableViewCell() }
        
        
        switch indexPath.row {
        case 0:
            cell.nameSetting.setImage(UIImage(systemName: "pencil"), for: .normal)
            cell.nameSetting.setTitle(" 내 이름 설정하기", for: .normal)
            cell.nameSetting.tag = 1
            cell.userDetail.text = MainViewController.user
            
        case 1:
            cell.nameSetting.setImage(UIImage(systemName: "moon.fill"), for: .normal)
            cell.nameSetting.setTitle(" 다마고치 변경하기", for: .normal)
            cell.nameSetting.tag = 2
            cell.userDetail.text = " "
        case 2:
            cell.nameSetting.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
            cell.nameSetting.setTitle(" 데이터 초기화", for: .normal)
            cell.nameSetting.tag = 3
            cell.userDetail.text = " "
        default:
            break
        }
        
        cell.nameSetting.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
