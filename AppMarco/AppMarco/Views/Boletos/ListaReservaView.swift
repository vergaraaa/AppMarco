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
        
        VStack(){
            Text("Mi Historial de Visitas")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top)
            
            List{
                ForEach(reservas){
                    reserva in
                    
                    HStack(alignment: .top, spacing: 10){
                        Image("boleto")
                            .resizable()
                            .aspectRatio(contentMode:  .fill)
                            .frame(width:55, height:55)
                            .clipShape(Rectangle())
                        
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
}

struct ListaReservaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaReservaView()
    }
}
