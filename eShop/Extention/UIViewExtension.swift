//
//  UIViewExtension.swift
//  eShop
//
//  Created by Oleg Chudnovskij on 28.06.2020.
//  Copyright © 2020 Oleg Chudnovskij. All rights reserved.
//

import UIKit

extension UIView {
  func corner(radius: CGFloat = 25) {
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
  }
}

extension UIViewController {
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
