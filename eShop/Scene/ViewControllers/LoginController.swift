//
//  LoginController.swift
//  eShop
//
//  Created by Oleg Chudnovskij on 26.06.2020.
//  Copyright © 2020 Oleg Chudnovskij. All rights reserved.
//

import UIKit

class LoginController: ViewController {

    @IBOutlet private weak var loginTextField: CustomTextField!
    @IBOutlet private weak var passTextField: CustomTextField!
    @IBOutlet private weak var signInBtn: UIButton?
    @IBOutlet private weak var fogotPswBtn: UIButton?
    @IBOutlet private weak var registrationBtn: UIButton?
    @IBOutlet private weak var fbLoginBtn: UIButton?
    @IBOutlet private weak var googleLoginBtn: UIButton?


    
    
    
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
        signInBtn!.border()
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
        loginTextField?.textField.textContentType = .username

        
        passTextField?.textField.autocorrectionType = UITextAutocorrectionType.no
        passTextField?.textField.returnKeyType = UIReturnKeyType.done
        passTextField?.textField.isSecureTextEntry = true
        passTextField?.textField.textContentType = .password
        
        loginTextField?.textField.delegate = self
        passTextField?.textField.delegate = self
    }
}

//MARK: - extension
extension LoginController: UITextFieldDelegate {
    
    //когда пользователь нажал кнопку Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField?.textField {
            // переводим ввод на 2-е поле
            passTextField?.textField.becomeFirstResponder()
        } else {
        //спрятать клавиатуру
        textField.resignFirstResponder()
        }
        return true
    }
       
       func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
           // return NO to disallow editing.
           print("TextField should begin editing method called")
           return true
       }
       
       func textFieldDidBeginEditing(_ textField: UITextField) {
           // became first responder
           print("TextField did begin editing method called")
       }
       
       func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
           // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
           print("TextField should snd editing method called")
           return true
       }
       
       func textFieldDidEndEditing(_ textField: UITextField) {
           // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
           print("TextField did end editing method called")
       }
       
    internal func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
           // if implemented, called in place of textFieldDidEndEditing:
           print("TextField did end editing with reason method called")
       }
       
       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // return NO to not change text
           print("While entering the characters this method gets called")
           return true
       }
}
