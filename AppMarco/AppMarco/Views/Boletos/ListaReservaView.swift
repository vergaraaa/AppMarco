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
            
            List{
                ForEach(reservas){
                    reserva in
                    
                    HStack{
                        Text(reserva.guide.name)
                        VStack(alignment: .leading, spacing: 10){

                            
                            Text(("Dia: \(reserva.date)"))
                                .frame(maxHeight: 100, alignment: .top)
                            Text(("Hora: \(reserva.hour)"))
                                .frame(maxHeight: 100, alignment: .top)
                            Text("Guia: " + (reserva.guide.name))
                                .fontWeight(.semibold)
                                //.foregroundColor(.grey)

                            }
                    }
                    
                }
            }
            .onAppear(){
                reservaVM.getReservas{(result) in
                DispatchQueue.main.async{
                    self.reservas = result
                }
            }
        }
        }
    }
        //var note: String
//        var boletoImg: String?
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
//                       )
//                        }
//
//                    }
//    //                NavigationLink(
//                    destination: ReservaGuiaView(fecha_nueva: reserva.fecha, email: reserva.email, cantPer: reserva.cantPer, hora_elegida: reserva.hora, horas_disponibles: reserva.hora_disponible),
//                    label: {
//                       )
//                }
//            }
//
//                }
//            }
////        }
//    }
}

struct ListaReservaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaReservaView()
    }
}
