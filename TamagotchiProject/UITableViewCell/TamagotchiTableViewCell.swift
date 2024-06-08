//
//  DamagotchiTableViewCell.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/7/24.
//

import UIKit
import SnapKit


class TamagotchiTableViewCell: UITableViewCell {

    
    enum Character {
        typealias RawValue = String
        
        static var cactus = "따끔따끔 다마고치"
        static var sun = "방실방실 다마고치"
        static var star = "반짝반짝 다마고치"
    }
    static func configureTamagotchiLabel(label: UILabel, fontSize: CGFloat) {
        label.font = .systemFont(ofSize: fontSize)
        label.layer.borderColor = UIColor.borderColor.cgColor
        label.layer.borderWidth = 0.5
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
    }
    
    let imageLabel1 = {
        let button = UIButton()
        button.setImage(UIImage._1_6, for: .normal)
        button.tag = 1
        return button
    }()
    let imageLabel1Title = {
        let label = UILabel()
        TamagotchiTableViewCell.configureTamagotchiLabel(label: label, fontSize: 13)
        label.text = Character.cactus
        return label
    }()
    let imageLabel2 = {
        let button = UIButton()
        button.setImage(UIImage._2_6, for: .normal)
        button.tag = 2
        return button
    }()
    let imageLabel2Title = {
        let label = UILabel()
        label.text = Character.sun
        TamagotchiTableViewCell.configureTamagotchiLabel(label: label, fontSize: 13)
        return label
    }()
    let imageLabel3 = {
        let button = UIButton()
        button.setImage(UIImage._3_6, for: .normal)
        button.tag = 3
        return button
    }()
    // 폰트, 보더칼라. 보더넓이, 텍스트얼라인먼트, 클리스투바운드 ,코너 래디어스
    
    let imageLabel3Title = {
        let label = UILabel()
        label.text = Character.star
        TamagotchiTableViewCell.configureTamagotchiLabel(label: label, fontSize: 13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        contentView.addSubview(imageLabel1)
        contentView.addSubview(imageLabel1Title)
        contentView.addSubview(imageLabel3)
        contentView.addSubview(imageLabel3Title)
        contentView.addSubview(imageLabel2)
        contentView.addSubview(imageLabel2Title)
       
    }
    
    func configureLayout() {
        imageLabel1.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(100)
        }
        imageLabel3.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(100)
        }
        imageLabel2.snp.makeConstraints { make in
            make.leading.equalTo(imageLabel1.snp.trailing).offset(25)
            make.size.equalTo(100)
        }
        imageLabel1Title.snp.makeConstraints { make in
            make.top.equalTo(imageLabel1.snp.bottom).offset(8)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
        imageLabel3Title.snp.makeConstraints { make in
            make.top.equalTo(imageLabel1.snp.bottom).offset(8)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
        imageLabel2Title.snp.makeConstraints { make in
            make.top.equalTo(imageLabel1.snp.bottom).offset(8)
            make.leading.equalTo(imageLabel1Title.snp.trailing).offset(15)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
  
}
