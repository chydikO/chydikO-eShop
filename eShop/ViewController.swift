//
//  ViewController.swift
//  eShop
//
//  Created by Oleg Chudnovskij on 26.06.2020.
//  Copyright © 2020 Oleg Chudnovskij. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setup() {
        view.backgroundColor = .white
        setupButton()
        initializeData()
    }
    
    func setupButton(){
        
    }
    func initializeData() {
        
    }
}

