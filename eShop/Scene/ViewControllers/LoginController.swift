//
//  LoginController.swift
//  eShop
//
//  Created by Oleg Chudnovskij on 26.06.2020.
//  Copyright © 2020 Oleg Chudnovskij. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet private weak var loginTextField: CustomTextField!
    @IBOutlet private weak var passTextField: CustomTextField!
    @IBOutlet private weak var signInBtn: UIButton?
    @IBOutlet private weak var fogotPswBtn: UIButton?
    @IBOutlet private weak var registrationBtn: UIButton?
    @IBOutlet private weak var fbLoginBtn: UIButton?
    @IBOutlet private weak var googleLoginBtn: UIButton?


    let btnAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 22),
        .foregroundColor: UIColor(red: 154/255.0, green: 184/255.0, blue: 212/255.0, alpha: 1.0),
        .underlineStyle: NSUnderlineStyle.single.rawValue]
        //.double.rawValue, .thick.rawValue
        as [NSAttributedString.Key : Any]
    
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
        setupButton()
        initializeData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    //MARK: - private func
    private func setupButton() {
        signInBtn!.corner()
        [fbLoginBtn, googleLoginBtn].forEach { $0?.corner(radius: 10) }

        
        let btnLoginAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 22),
        .foregroundColor: UIColor(red: 154/255.0, green: 184/255.0, blue: 212/255.0, alpha: 1.0),
        .underlineStyle: NSUnderlineStyle.single.rawValue]
        //.double.rawValue, .thick.rawValue
        as [NSAttributedString.Key : Any]
        
        let btnFogotPswAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 15),
        .foregroundColor: UIColor(red: 154/255.0, green: 184/255.0, blue: 212/255.0, alpha: 1.0),
        .underlineStyle: NSUnderlineStyle.single.rawValue]
        //.double.rawValue, .thick.rawValue
        as [NSAttributedString.Key : Any]
        
        let signInAttributeString = NSMutableAttributedString(string: "Sign Up",
                                                        attributes: btnLoginAttributes)
        registrationBtn?.setAttributedTitle(signInAttributeString, for: .normal)
        
        let fogotPswAttributeString = NSMutableAttributedString(string: "Fogot password?",
                                                        attributes: btnFogotPswAttributes)
        fogotPswBtn?.setAttributedTitle(fogotPswAttributeString, for: .normal)
    }
    
    private func initializeData() {
        /// Placeholder text
        loginTextField.placeholderText = "User name"
        passTextField.placeholderText = "Password"
        
        loginTextField?.textField.autocorrectionType = UITextAutocorrectionType.no
        loginTextField?.textField.returnKeyType = UIReturnKeyType.next
        
        passTextField?.textField.autocorrectionType = UITextAutocorrectionType.no
        passTextField?.textField.returnKeyType = UIReturnKeyType.done
        passTextField?.textField.isSecureTextEntry = true
        
    }
}
