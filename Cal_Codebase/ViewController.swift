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
        
        
    }
    override func loadView() {
        super.loadView()
        subView = SubView(frame: self.view.frame)
        self.view = subView
    }


}


#Preview{
    let vc = ViewController()
    return vc
}

