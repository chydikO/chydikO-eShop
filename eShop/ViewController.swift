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
    
    func setup() {
        view.backgroundColor = .white
        setupButton()
        initializeData()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func setupButton(){
        
    }
    func initializeData() {
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        view.endEditing(true)
    }
    
    func resizeViewOnKeyboardMove(scrollView: UIScrollView?) {
        guard let scrollView = scrollView else {
            return
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil,
                                               queue: OperationQueue.main)
        { [weak self] notification in
            // frame
            guard let frameEnd = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frameEnd.size.height + 21, right: 0)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: OperationQueue.main)
        { [weak self] _ in
            scrollView.contentInset = UIEdgeInsets.zero
        }
    }
}

