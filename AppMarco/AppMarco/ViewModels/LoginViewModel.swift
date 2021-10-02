//
//  LoginViewModel.swift
//  AppMarco
//
//  Created by user191983 on 10/2/21.
//

import Foundation

class LoginViewModel : ObservableObject {
    
    var email : String = ""
    var password : String = ""
    
    @Published var isLogged : Bool = false
    
    func login() {
        
        WebService().login(email: email, password: password) { result in
            print(result)
            switch (result) {
            case .success(let token):
                print(token)
                self.isLogged = true
            
                case .failure(let error):
                    self.isLogged = false
//                    print(error)
            }
        }
    }
}
