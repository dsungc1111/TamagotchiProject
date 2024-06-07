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
