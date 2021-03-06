//
//  ReservaGuiaDetailView.swift
//  AppMarco
//
//  Created by user191983 on 10/21/21.
//

import SwiftUI

struct ReservaGuiaDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var reservation: ReservasModel
    
    //@State var spots: String = ""
    @State var spots: Int = 1
    let utcISODateFormatter = ISO8601DateFormatter()
    @EnvironmentObject private var reservaVM : ReservaViewModel
    var email : String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password : String = UserDefaults.standard.string(forKey: "password") ?? ""
    var id : String = UserDefaults.standard.string(forKey: "id") ?? ""
    var name : String = UserDefaults.standard.string(forKey: "name") ?? ""
    var lastname : String = UserDefaults.standard.string(forKey: "lastname") ?? ""
    
    var body: some View {
        ZStack{
            
           
            VStack(alignment: .center, spacing: 5){
                //Color("RosaMarco")
                
                 Image(systemName: "bookmark.circle.fill")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("RosaMarco"))
                 
                Divider()
                Text("Confirma tu Reserva")
                    .font(.title)
                    .bold()
             
                //Text(utcISODateFormatter.string(from: reservation.date))
                
                Text(reservation.date, style: .date)
                Text(reservation.hour)
                //.scaledToFit()
                    //.foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text("Guia: " + reservation.guide.name)
                    .fontWeight(.semibold)
                    .font(.title3)
                
                Text("Cantidad de personas")
                    .fontWeight(.semibold)
                    .font(.title3)
                
                //TextField("Spots", text: $spots)
                  //  .multilineTextAlignment(TextAlignment.center)
                
                Stepper(" \(spots) ", onIncrement: {spots = spots + 1}, onDecrement: {spots = spots - 1})
                    .frame(width: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Divider()
                Button(action: {
                    reservaVM.addReserva(id: reservation.id, user: id, date: reservation.date, hour: reservation.hour, spots: spots, guide: reservation.guide)
                                   }, label: {
                                       Spacer()
                                       Text("Reservar")
                                           .bold()
                   //                        .frame(width: 200, height: 50, alignment: .center)
                                          .clipShape(Capsule())
                   //                        //.background(Color("MarcoRosa"))
                   //                        .foregroundColor(Color("MarcoRosa"))
                                           
                                   })
                                   .alert(isPresented: $reservaVM.showAlertAddReserva) {
                                       Alert(title: Text("Confirmaci??n"),
                                           message: Text(reservaVM.textAlert),
                                           dismissButton: Alert.Button.default(
                                               Text("ok"), action: { self.presentationMode.wrappedValue.dismiss() }
                                           )
                                       )
                                       
                                       //Alert(title: Text(reservaVM.textAlert))
                                   }
                                   //.frame(width: 100, height: 30, alignment: .center)
                                  // .buttonStyle(.square)
            }
            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
            .foregroundColor(Color("RosaMarco"))
            
            
        }
    }
}

