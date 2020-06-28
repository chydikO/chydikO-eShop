//
//  UserInApp.swift
//  eShop
//
//  Created by Oleg Chudnovskij on 26.06.2020.
//  Copyright © 2020 Oleg Chudnovskij. All rights reserved.
//

import Foundation

enum LoginType: String {
  case normal = "Sign In normally"
  case facebook = "Facebook"
  case apple = "Apple"
  case google = "Google"
  
  var name: String {
    return self.rawValue
  }
}

struct User {
  var username: String?
  var password: String?
  var token: String?
  
  init(username: String?, password: String?, token: String? = nil) {
    self.username = username
    self.password = password
    self.token = token
  }
}
