//
//  SubView.swift
//  Cal_Codebase
//
//  Created by rin kim on 6/28/24.
//

import UIKit
import SnapKit
class SubView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeNumLabel(numberLabel, self)
        makeButtons(VStackView, HStackView, buttons)
        makeLayout(VStackView, self)
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been imolemented") }
    
    let numberLabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let buttons = {
        return ["7", "8", "9", "+", "4", "5", "6", "-", "1", "2", "3", "*", "AC", "0", "=", "/" ].map{
            let x = UIButton()
            x.setTitle($0, for: .normal)
            x.setTitleColor(.white, for: .normal)
            x.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            x.frame.size.height = 80
            x.frame.size.width = 80
            x.layer.cornerRadius = x.frame.size.width / 2
            if Int(x.currentTitle!) != nil {
                x.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            }
            else { x.backgroundColor = .orange}
            return x
        }
    }()
    
    let HStackView = {
        var x = [UIStackView]()
        for _ in 0..<4 {
            let y = UIStackView()
            y.axis = .horizontal
            y.backgroundColor = .black
            y.spacing = 10
            y.distribution = .fillEqually
            x.append(y)
        }
        return x
    }()
    
    let VStackView = {
        let x = UIStackView()
        x.axis = .vertical
        x.backgroundColor = .black
        x.spacing = 10
        x.distribution = .fillEqually
        return x
    }()
    
    func makeNumLabel(_ label: UILabel, _ view: UIView) {
        view.addSubview(label); label.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }
    
    
    func makeButtons(_ V: UIStackView, _ H: [UIStackView], _ btns: [UIButton]) {
        for i in 0...15 { let hsi = i / 4; H[hsi].addArrangedSubview(btns[i]) }
        for i in 0..<4 { V.addArrangedSubview(H[i]) }
    }
    
    func makeLayout(_ V: UIStackView, _ view: UIView) {
        view.addSubview(V); V.snp.makeConstraints{
            $0.width.equalTo(350)
            $0.height.equalTo(350)
            $0.top.equalToSuperview().offset(400)
            $0.centerX.equalToSuperview()
        }
        
    }
    



}
