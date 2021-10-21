
import Foundation

import SwiftUI

class ReservaViewModel : ObservableObject {
    @Published var arrReservas = [ReservasModel]()
    
    init(){
        
        //addReserva()
       //getReservas()
    }


    
    func addReserva(username : String, fecha: Date, hora: String, cantPer: Int, guia: String)  {
        
        
        
//    func addReserva()  {


        WebService().addReserva(username : username, fecha: fecha, hora: hora, cantPer: cantPer, guia : guia) { result in

            switch (result) {
            case .success(let succ ):
                print(succ)


                case .failure(let error):

                    print(error)


            }

        }

    }

    func getReservas(completion: @escaping ([ReservasModel])->()) {

        let username = UserDefaults.standard.string(forKey: "username") ?? " "

        WebService().getReservas(username: username) { result in
            switch result {
                case .success(let reservas):
                        print("Obtuvo las reservas")
                        
                    self.arrReservas = reservas.reservation
                    DispatchQueue.main.async {
                        completion(reservas.reservation) //esta en thred preincipal
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func getReservasFechas() {

        let username = UserDefaults.standard.string(forKey: "username") ?? " "

        WebService().getReservas(username: username) { result in
            switch result {
                case .success(let reservas):
                        print("Obtuvo las reservas")
                        
                    self.arrReservas = reservas.reservation

                case .failure(let error):
                    print(error)
            }
        }
    }
    
    
}
