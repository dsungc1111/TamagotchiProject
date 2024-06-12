//
//  ViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/7/24.
//

import UIKit

class SelectViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.fixedColor
        
        if Variable.changeTamaCount == 0 {
            navigationItem.title = "다마고치 선택하기"
        } else {
            navigationItem.title = "다마고치 변경하기"
        }
        
        
        configureHierarchy()
        configureLayout()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TamagotchiTableViewCell.self, forCellReuseIdentifier: TamagotchiTableViewCell.identifier)
        tableView.register(ReadyTableViewCell.self, forCellReuseIdentifier: ReadyTableViewCell.identifier)
        
    }
    
    @objc func TamagotchiButtonTapped(_ sender: UIButton) {
        
        let vc = TamagotchiViewController()
        
        switch sender.tag {
        case 1 :
            vc.mainLabel.text = Constant.Character.cactus.rawValue
            vc.mainImage.image = UIImage._1_6
            vc.imageDescription.text = Constant.DescriptionTamagotchi.cactus.rawValue
            Variable.pickedTama = sender.tag
        case 2:
            vc.mainImage.image = UIImage._2_6
            vc.mainLabel.text = Constant.Character.sun.rawValue
            vc.imageDescription.text = Constant.DescriptionTamagotchi.sun.rawValue
            Variable.pickedTama = sender.tag
        case 3:
            vc.mainImage.image = UIImage._3_6
            vc.mainLabel.text = Constant.Character.star.rawValue
            vc.imageDescription.text = Constant.DescriptionTamagotchi.star.rawValue
            Variable.pickedTama = sender.tag
        default:
            break
        }
        present(vc, animated: true)
        
    }
    

    func configureHierarchy() {
        view.addSubview(tableView)
    }
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
    }
    
    
}


extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TamagotchiTableViewCell.identifier, for: indexPath) as? TamagotchiTableViewCell else { return TamagotchiTableViewCell() }
            
            
            cell.imageLabel1.addTarget(self, action: #selector(TamagotchiButtonTapped), for: .touchUpInside)
            cell.imageLabel2.addTarget(self, action: #selector(TamagotchiButtonTapped), for: .touchUpInside)
            cell.imageLabel3.addTarget(self, action: #selector(TamagotchiButtonTapped), for: .touchUpInside)
            
           return cell
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReadyTableViewCell.identifier, for: indexPath) as? ReadyTableViewCell else { return ReadyTableViewCell() }
           return cell
        }
        

                
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
        
        
        return 150// 원하는 셀 높이 설정
       }
       
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
       
    
}
