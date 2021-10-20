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

struct AddReservaRequestBody: Codable{
    
    let usuario: String
    let fecha : Date
    let hora : String
    let canPer : Int
    let guia: String
}


struct AddReservaResponse: Codable{
    let message: String?
    
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
        
        guard let url = URL(string: "http://100.24.228.237:10021/api/users/login") else {
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
    
    
    
    func addReserva( username : String, fecha: Date, hora: String, cantPer: Int, guia: String, completion: @escaping (Result<Bool, ComunicationError>) -> Void) {

        guard let url = URL(string: "http://100.24.228.237:10021/reservations/add") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }

        let body = AddReservaRequestBody(usuario: username, fecha: fecha, hora: hora, canPer: cantPer, guia: guia)

        print(body)

        //Codigo para formatear la fecha antes de enviarla a la API
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(formatter)


        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.httpBody = try? JSONEncoder().encode(body)
        request.httpBody = try? encoder.encode(body)  // con esta linea de código puedes enviar la fecha formateada

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }

            guard let AddReservaResponse = try? JSONDecoder().decode(AddReservaResponse.self, from: data) else {
                completion(.failure(.connectionError))
                return
            }

            /*guard let token = AddReservaResponse.success else {
                completion(.failure(.connectionError))
                return
            }*/

            completion(.success(true))


        }.resume()
    }

    func getReservas(username : String, completion: @escaping (Result<ReservasResponse, ComunicationError>) -> Void) {

        guard let url = URL(string: "http://100.24.228.237:10021/" + username) else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }


        URLSession.shared.dataTask(with: url) { data, response, error in
            let Response = try! JSONDecoder().decode(ReservasResponse.self, from: data!)
            print(Response)
            DispatchQueue.main.async {
                completion(.success(Response))
            }
        }.resume()


    }
    
    
    func getReservasFechas(fecha : Date, completion: @escaping (Result<ReservasResponse, ComunicationError>) -> Void) {

        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let fechaNueva = formatter1.string(from: fecha)
        
        guard let url = URL(string: "http://100.24.228.237:10021/reservations/" + fechaNueva) else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }


        URLSession.shared.dataTask(with: url) { data, response, error in
            let Response = try! JSONDecoder().decode(ReservasResponse.self, from: data!)
            print(Response)
            DispatchQueue.main.async {
                completion(.success(Response))
            }
        }.resume()


    }

    
    func signup(name: String, lastname: String, email: String, password: String, usertype: [String], completion: @escaping (Result<Bool, ComunicationError>) -> Void) {
        
        guard let url = URL(string: "http://100.24.228.237:10021/api/users/") else {
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
            
            guard let url = URL(string: "http://100.24.228.237:10021/api/expos") else {
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
    
    
    func getEventos(completion: @escaping (Result<[Eventos], ComunicationError>) -> Void) {
            
            guard let url = URL(string: "http://100.24.228.237:10021/api/activities/month") else {
                completion(.failure(.custom(errorMessage: "URL is not Correct")))
                return
            }

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(data!.count)
                let eventosResponse = try! JSONDecoder().decode([Eventos].self, from: data!)
                print(eventosResponse)
                DispatchQueue.main.async {
                    completion(.success(eventosResponse))
                }
                
            }.resume()  
    }
}
