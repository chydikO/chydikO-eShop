//
//  RegistrationController.swift
//  eShop
//
//  Created by Oleg Chudnovskij on 29.06.2020.
//  Copyright © 2020 Oleg Chudnovskij. All rights reserved.
//

import UIKit

class RegistrationController: ViewController {

    @IBOutlet private weak var loginTextField: CustomTextField!
    @IBOutlet private weak var passTextField: CustomTextField!
    @IBOutlet private weak var confirmPassTextField: CustomTextField!

    @IBOutlet private weak var registrationBtn: UIButton?
    @IBOutlet private weak var cancelBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registrationBtnClicked() {
        
    }
    
    @IBAction func cancelBtnBtnClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}
