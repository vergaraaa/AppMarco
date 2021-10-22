
import Foundation

import SwiftUI

class ReservaViewModel : ObservableObject {
    @Published var arrReservas = [ReservasModel]()
    
    init(){
        
        //addReserva()
       //getReservas()
    }


    
    func addReserva(id: String, user: String, date: Date, hour: String, spots: Int, guide: GuideModel)  {
        
        WebService().addReserva(id: id, user : user, date: date, hour: hour, spots: spots, guide : guide) { result in

            switch (result) {
            case .success(let succ ):
                print(succ)


                case .failure(let error):

                    print(error)


            }

        }

    }

    func getReservas(completion: @escaping ([ReservasModel])->()) {

        let id = UserDefaults.standard.string(forKey: "id") ?? " "

        WebService().getReservas(id: id) { result in
            switch result {
                case .success(let reservas):
                        print("Obtuvo las reservas")

                    self.arrReservas = reservas
                    DispatchQueue.main.async {
                        completion(reservas) //esta en thred preincipal
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func getReservasFechas(fecha : Date , completion: @escaping ([ReservasModel])->()) {
        
        
        WebService().getReservasFechas(fecha: fecha) { result in
            switch result {
                case .success(let reservas):
                        print("Obtuvo las reservas")
                        
                    self.arrReservas = reservas
                    DispatchQueue.main.async {
                        completion(self.arrReservas) //esta en thred preincipal
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    
}
