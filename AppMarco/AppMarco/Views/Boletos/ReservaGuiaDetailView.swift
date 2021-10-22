//
//  ReservaGuiaDetailView.swift
//  AppMarco
//
//  Created by user191983 on 10/21/21.
//

import SwiftUI

struct ReservaGuiaDetailView: View {
    var reservation: ReservasModel
    @State var spots: String = ""
    let utcISODateFormatter = ISO8601DateFormatter()
    @EnvironmentObject private var reservaVM : ReservaViewModel
    var email : String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password : String = UserDefaults.standard.string(forKey: "password") ?? ""
    var id : String = UserDefaults.standard.string(forKey: "id") ?? ""
    var name : String = UserDefaults.standard.string(forKey: "name") ?? ""
    var lastname : String = UserDefaults.standard.string(forKey: "lastname") ?? ""
    
    var body: some View {
        ZStack{
            Color("BgVeige")
            
            VStack{
                
                Text(utcISODateFormatter.string(from: reservation.date))
                
                Text(reservation.hour)
                
                Text(reservation.guide.name)
                
                TextField("Total number of people", text: $spots)
                    .keyboardType(.numberPad)
                
                Button(action: {
                    reservaVM.addReserva(id: reservation.id, user: id, date: reservation.date, hour: reservation.hour, spots: Int(spots) ?? 0, guide: reservation.guide)
                }, label: {
                    Text("Reservar")
                })
            }
            
            
        }
    }
}

