//
//  ReadyTableViewCell.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/7/24.
//

import UIKit

class ReadyTableViewCell: UITableViewCell {
    
    
    
    let readyImage1 = {
        let image = UIImageView()
        image.image = UIImage.no
        return image
    }()
    let readyImage2 = {
        let image = UIImageView()
        image.image = UIImage.no
        return image
    }()
    let readyImage3 = {
        let image = UIImageView()
        image.image = UIImage.no
        return image
    }()
    var readyLabel1 = UILabel()
    var readyLabel2 = UILabel()
    var readyLabel3 = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DamagotchiTableViewCell.identifier)
        configureHierarchy()
        configureLayout()
        configureReadyLabel(label: readyLabel1)
        configureReadyLabel(label: readyLabel2)
        configureReadyLabel(label: readyLabel3)
    }
    
    
    func configureReadyLabel(label: UILabel) {
        label.text = "준비중이에요"
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 5 
        label.font = .systemFont(ofSize: 13)
        label.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        label.layer.borderWidth = 0.5
    }
    
    func configureHierarchy() {
        contentView.addSubview(readyImage1)
        contentView.addSubview(readyImage2)
        contentView.addSubview(readyImage3)
        contentView.addSubview(readyLabel1)
        contentView.addSubview(readyLabel2)
        contentView.addSubview(readyLabel3)
    }
    
    
    func configureLayout() {
        readyImage1.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(100)
        }
        readyImage3.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(100)
        }
        readyImage2.snp.makeConstraints { make in
            make.leading.equalTo(readyImage1.snp.trailing).offset(25)
            make.size.equalTo(100)
        }
        readyLabel1.snp.makeConstraints { make in
            make.top.equalTo(readyImage1.snp.bottom).offset(8)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
        readyLabel3.snp.makeConstraints { make in
            make.top.equalTo(readyImage1.snp.bottom).offset(8)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
        readyLabel2.snp.makeConstraints { make in
            make.top.equalTo(readyImage1.snp.bottom).offset(8)
            make.leading.equalTo(readyLabel1.snp.trailing).offset(15)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
