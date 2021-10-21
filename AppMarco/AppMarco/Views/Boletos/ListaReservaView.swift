//
//  ListaReservaView.swift
//  AppMarco
//
//  Created by user195902 on 10/21/21.
//

import SwiftUI

struct ListaReservaView: View {
    @EnvironmentObject var reservaVM : ReservaViewModel
    @State var reservas = [ReservasModel]()
    
    var body: some View {
        
        VStack{
            Text("Hi")
        }
        //var note: String
        //var boletoImg: String?
//        VStack{
//            List{
//                ForEach(reservas){
//                    reserva in
//
//                    HStack(alignment: .top, spacing: 10, content: {
////                        Image("boleto")
////                            .resizable()
////                            .aspectRatio(contentMode:  .fill)
////                            .frame(width:55, height:55)
////                            .clipShape(Rectangle())
//
//                        VStack(alignment: .leading, spacing: 10){
//
//                            Text("Reserva de")
//                                .fontWeight(.bold)
//                                .foregroundColor(.primary)
//                                    +
//                            Text(reserva.email)
//                                    .foregroundColor(.gray)
//
//                            Text("Cantidad: " + (reserva.cantPer))
//                                .frame(maxHeight: 100, alignment: .top)
//                            Text(("Dia: \(reserva.fecha)"))
//                                .frame(maxHeight: 100, alignment: .top)
//                            Text("Guia: " + (reserva.guia))
//                                .fontWeight(.semibold)
//                                .foregroundColor(.grey)
//
//                            })
//                        }
//
//                    }
//    //                NavigationLink(
//                    destination: ReservaGuiaView(fecha_nueva: reserva.fecha, email: reserva.email, cantPer: reserva.cantPer, hora_elegida: reserva.hora, horas_disponibles: reserva.hora_disponible),
//                    label: {
//                       )
//                }
//            }
//            .onAppear(){
//                reservaVM.getReservas{(result) in
//                    DispatchQueue.main.async{
//                        self.reservas = result
//                    }
//                }
//            }
//        }
    }
}

struct ListaReservaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaReservaView()
    }
}
