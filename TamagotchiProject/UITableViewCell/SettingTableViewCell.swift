//
//  SettingTableViewCell.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/8/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

  
    
    var userDetail = {
        let username = UILabel()
        username.textColor = .darkGray
        // username.backgroundColor = .systemBlue
        return username
    }()
    
    
    let nameSetting = {
        let user = UIButton()
        user.tintColor = .black
        user.setTitleColor(.darkGray, for: .normal)
        user.contentHorizontalAlignment = .left
        user.contentVerticalAlignment = .center
        return user
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    

    
    func configureHierarchy() {
        contentView.addSubview(nameSetting)
        contentView.addSubview(userDetail)
    }
    func configureLayout() {
        nameSetting.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(15)
        }
        userDetail.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(15)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
