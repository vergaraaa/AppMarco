//
//  WebServices.swift
//  Login
//
//  Created by Elvia Rosas on 14/09/21.
//

import Foundation

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

enum ComunicationError: Error{
    case connectionError
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable{
    let email : String
    let password: String
}

struct LoginResponse: Codable{
    let message: String?
    let token: String?
    let usertype: [String]?
    let success: Bool?
}

struct SignUpRequestBody: Codable{
    let name: String
    let lastname: String
    let email : String
    let password: String
    let usertype: [String]
}

struct SignUpResponse: Codable{
    let message: String?
    let success: Bool?
}

class WebService{
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://api-marco.herokuapp.com/api/users/login") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
    
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
            
            
        }.resume()
    }
    
    func signup(name: String, lastname: String, email: String, password: String, usertype: [String], completion: @escaping (Result<Bool, ComunicationError>) -> Void) {
        
        guard let url = URL(string: "https://api-marco.herokuapp.com/api/users/") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
    
        let body = SignUpRequestBody(name: name, lastname: lastname, email: email, password: password, usertype: usertype)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let SignUpResponse = try? JSONDecoder().decode(SignUpResponse.self, from: data) else {
                completion(.failure(.connectionError))
                return
            }
            
            guard let success = SignUpResponse.success else {
                completion(.failure(.connectionError))
                return
            }
            completion(.success(success))
            
            
        }.resume()
    }
    
    func getExpos(completion: @escaping (Result<[Expos], ComunicationError>) -> Void) {
        
        guard let url = URL(string: "https://api-marco.herokuapp.com/api/expos/") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(data!.count)
            let exposResponse = try! JSONDecoder().decode([Expos].self, from: data!)
            print(exposResponse)
            DispatchQueue.main.async {
                completion(.success(exposResponse))
            }
            
        }.resume()
    }
}
