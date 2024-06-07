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
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        navigationItem.title = "다마고치 선택하기"
        configureHierarchy()
        configureLayout()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DamagotchiTableViewCell.self, forCellReuseIdentifier: DamagotchiTableViewCell.identifier)
        tableView.register(ReadyTableViewCell.self, forCellReuseIdentifier: ReadyTableViewCell.identifier)
        
    }
    
    @objc func TamagotchiButtonTapped(_ sender: UIButton) {
        
        let vc = TamagotchiViewController()
        
        switch sender.tag {
        case 0 :
            vc.mainLabel.text = "따끔따끔 다마고치"
            vc.mainImage.image = UIImage._1_6
            vc.imageDescription.text = "\n\n저는 선인장 다마고치입니다. 키는 2cm, 몸무게는 150g이에요.\n성격은 소심하지만 마음은 따뜻해요.\n열심히 잘 먹고 클 자신은 있답니다\n반가워요 주인님!!!"
        case 1:
            vc.mainImage.image = UIImage._2_6
            vc.mainLabel.text = "방실방실 다마고치"
            vc.imageDescription.text = "\n\n저는 방실방실 다마고치입니다. 키는 100km, 몸주게는 150톤이에용\n성격은 화끈하고 날라다닙니당~! \n열심히 잘 먹고 클 자신은 있답니당 방실방실!"
        case 2:
            vc.mainImage.image = UIImage._3_6
            vc.mainLabel.text = "반짝반짝 다마고치"
            vc.imageDescription.text = "\n\n얘는 설명이 없네요??"
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DamagotchiTableViewCell.identifier, for: indexPath) as? DamagotchiTableViewCell else { return DamagotchiTableViewCell() }
            
            
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
