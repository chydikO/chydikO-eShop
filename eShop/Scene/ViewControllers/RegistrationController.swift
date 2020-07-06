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
    
    @IBOutlet private weak var scrollView: UIScrollView?


    override func viewDidLoad() {
        super.viewDidLoad()
        super.setup()
        resizeViewOnKeyboardMove(scrollView: scrollView)
    }
    
    @IBAction func registrationBtnClicked() {
        
    }
    
    @IBAction func cancelBtnBtnClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
      //MARK: - private func
    internal override func setupButton() {
            [registrationBtn, cancelBtn].forEach { $0?.corner() }
            [registrationBtn, cancelBtn].forEach { $0?.border() }
        }
        
    internal override func initializeData() {
            /// Placeholder text
            loginTextField.placeholderText = "User name"
            passTextField.placeholderText = "Password"
            confirmPassTextField.placeholderText = "Confirm Password"
            
            loginTextField?.textField.autocorrectionType = UITextAutocorrectionType.no
            loginTextField?.textField.returnKeyType = UIReturnKeyType.next
            loginTextField?.textField.textContentType = .username

            
            passTextField?.textField.autocorrectionType = UITextAutocorrectionType.no
            passTextField?.textField.returnKeyType = UIReturnKeyType.next
            passTextField?.textField.isSecureTextEntry = true
            passTextField?.textField.textContentType = .password
            
            confirmPassTextField?.textField.autocorrectionType = UITextAutocorrectionType.no
            confirmPassTextField?.textField.returnKeyType = UIReturnKeyType.done
            confirmPassTextField?.textField.isSecureTextEntry = true
            confirmPassTextField?.textField.textContentType = .password
            
            loginTextField?.textField.delegate = self
            passTextField?.textField.delegate = self
            confirmPassTextField.textField.delegate = self
        }
    }

    //MARK: - extension
    extension RegistrationController: UITextFieldDelegate {
        
        //когда пользователь нажал кнопку Return
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            if textField == loginTextField?.textField {
                // переводим ввод на 2-е поле
                passTextField?.textField.becomeFirstResponder()
            } else if textField == passTextField?.textField {
                // переводим ввод на 2-е поле
                confirmPassTextField?.textField.becomeFirstResponder()
            }  else {
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
