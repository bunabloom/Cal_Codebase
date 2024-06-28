//
//  ViewController.swift
//  Cal_Codebase
//
//  Created by rin kim on 6/28/24.
//

import UIKit

class ViewController: UIViewController {
    var subView = SubView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        buttonsActions()
        
        
    }
    override func loadView() {
        super.loadView()
        subView = SubView(frame: self.view.frame)
        self.view = subView
        buttonsActions()
    }
    
    
    var tempStr = "0"
    
    
    private func buttonsActions() {
        let operation = [3, 7, 11, 15]
        let resetIndex = 12
        let equalIndex = 14
        
        for (index, btn) in subView.buttons.enumerated() {
            if let title = btn.titleLabel?.text {
                if Int(title) != nil || operation.contains(index) {
                    btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside) }
                else if index == resetIndex {subView.buttons[12].addTarget(self, action: #selector(reset), for: .touchDown)}
                else if index == equalIndex {subView.buttons[14].addTarget(self, action: #selector(sol), for: .touchDown)}
            }
        }
    }
    
    
    
    func sendToLabel() { subView.numberLabel.text? = tempStr }
    
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else { return nil }
    }
    
    
    @objc func buttonPressed(_ sender: UIButton) {
        
        if let buttonTitle = sender.titleLabel?.text {
            if Int(buttonTitle) != nil  { tempStr.append(buttonTitle) }
            else {
                if let lastCharacter = tempStr.last, !lastCharacter.isNumber { tempStr.removeLast() }
                tempStr.append(buttonTitle) }
        }; sendToLabel() }
    
    @objc private func reset() { tempStr = ""; subView.numberLabel.text? = "0" }
    
    @objc private func sol() {
        if let lastCharacter = tempStr.last, !lastCharacter.isNumber { tempStr.removeLast() }
        
        tempStr = String(calculate(expression: subView.numberLabel.text!)!)
        sendToLabel()
        
    }
}


#Preview{
    let vc = ViewController()
    return vc
}

