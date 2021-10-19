//
//  ReservaRestauranteswift
//  AppMarco
//
//  Created by user188940 on 9/6/21.
//

import SwiftUI

struct ReservaRestauranteView: View {
    var body: some View {
        ZStack{
            Color("BgVeige")
        
            VStack{
                
                Text("RESTAURANTE")
                    .font(.title)
                    .bold()
                
                Image("restaurantSymbol")
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .resizable()
                    .frame(width: 85, height: 85, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("RosaMarco"))
                
                Text("Reserva tu mesa y consulta nuestro delicioso menú")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                HStack{
                    Image("Comida1")
                        .resizable()
                        .scaledToFit()
                        //.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //fotos de comida, por el momento hardcodeado
                }
                Group{
                    NavigationLink(
                        destination: WebView(html: "https://www.marco.org.mx/wp-content/uploads/2021/07/menu-restaurante1.pdf"), //harcodeado
                        label: {
                            Text("Menú en línea")
                                .underline()
                                .foregroundColor(Color("RosaMarco"))
                                .padding()
                        })
                

                Text("Reservaciones")
                    .bold()
                    
                Image(systemName: "phone.fill")
                    .foregroundColor(Color("RosaMarco"))
                    
                Text("T. (81) 8262-4500, ext. 563")
                Text("restaurante@marco.org.mx")
                Text("")
                Text("Horario de comida:")
                    .bold()
                Text("Martes a domingo de 13:00 a 16:00")
                    .padding()
                }
            }
            .padding()
            .background(Color(.white))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("RosaMarco"), lineWidth: 3)
                )
            .padding(.horizontal, 15)

            
        } //ZStack
    }
}

struct ReservaRestauranteView_Previews: PreviewProvider {
    static var previews: some View {

        ReservaRestauranteView()
    }
}
