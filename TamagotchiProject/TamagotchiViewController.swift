//
//  GreenTamagotchiViewController.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/7/24.
//

import UIKit

class TamagotchiViewController: UIViewController {

    
    let mainImage = {
        let image = UIImageView()
        return image
    }()
    var mainLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.layer.borderWidth = 0.5
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    let imageDescription = {
        let text = UILabel()
        text.numberOfLines = 0
        text.textAlignment = .center
        text.textColor = .darkGray
        return text
    }()
    let cancelbutton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        return button
    }()
    let startButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        // Do any additional setup after loading the view.
        configureHierarchy()
        configureLayout()
        cancelbutton.addTarget(self, action: #selector(cancelbuttonTapped), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        imageDescription.layer.addBorder([.top], color: UIColor.darkGray, width: 1)

    }
    
    @objc func cancelbuttonTapped() {
        dismiss(animated: true)
    }
    
    func configureHierarchy() {
        view.addSubview(mainImage)
        view.addSubview(mainLabel)
        view.addSubview(imageDescription)
        view.addSubview(cancelbutton)
        view.addSubview(startButton)
    }
    func configureLayout() {
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(200)
        }
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10)
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        imageDescription.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        cancelbutton.snp.makeConstraints { make in
            make.top.equalTo(imageDescription.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        startButton.snp.makeConstraints { make in
            make.top.equalTo(imageDescription.snp.bottom).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    

}


extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
