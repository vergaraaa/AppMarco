//
//  LoginViewModel.swift
//  AppMarco
//
//  Created by user191983 on 10/2/21.
//

import Foundation

class LoginViewModel : ObservableObject {
    var id : String = UserDefaults.standard.string(forKey: "id") ?? ""
    var name : String = UserDefaults.standard.string(forKey: "name") ?? ""
    var lastname : String = UserDefaults.standard.string(forKey: "lastname") ?? ""
    var email : String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password : String = UserDefaults.standard.string(forKey: "password") ?? ""

    var usertype: [String] = [""]
    @Published var isLogged : Bool = false
    @Published var shortAlertLoginFail : Bool = false
    
    func login() {
        
        WebService().login(email: email, password: password) { result in
            print(result)
            switch (result) {
            case .success(let response):
                DispatchQueue.main.async {
                    UserDefaults.standard.setValue(response.id, forKey: "id")
                    UserDefaults.standard.setValue(response.name, forKey: "name")
                    UserDefaults.standard.setValue(response.lastname, forKey: "lastname")
                    UserDefaults.standard.setValue(self.email, forKey: "email")
                    UserDefaults.standard.setValue(self.password, forKey: "password")
                    self.isLogged = true
                }
                

                
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.isLogged = false
                        self.shortAlertLoginFail = true
                    }
//                    print(error)
            }
        }
    }
    
    func logout(){
        DispatchQueue.main.async {
            self.isLogged = false
        }
    }
    
    func signup(){
        WebService().signup(name: name, lastname: lastname, email: email, password: password, usertype: ["user"]) { result in
            
            switch (result) {
            case .success(let success):
                print(success)
                DispatchQueue.main.async {
                    self.isLogged = true
                }
                UserDefaults.standard.setValue(self.name, forKey: "name")
                UserDefaults.standard.setValue(self.lastname, forKey: "lastname")
                UserDefaults.standard.setValue(self.email, forKey: "email")
                UserDefaults.standard.setValue(self.password, forKey: "password")
                
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        self.isLogged = false
                    }
            }
        }    }
}
