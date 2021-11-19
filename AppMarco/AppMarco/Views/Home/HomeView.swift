//
//  Home.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

/*struct ImageOverlay: View{
    var body: some View{
        ZStack{
            Text("RECORRIDO VIRTUAL")
                .font(.custom("RobotoSlap-Medium", size: 24))
                .padding(10)
                .foregroundColor(.white)
        }.background(Color("RosaMarco"))
        
        .padding(10)
    }
}*/

struct HomeView: View {
    
    @StateObject var expo = ExpoViewModel()
    @StateObject var rv = RVModel()
    @State var selected : Int = 0
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    //var arrImages = ["https://www.marco.org.mx/wp-content/uploads/2021/10/EventON-Talleres-Lego-Octubre.jpg", "https://www.marco.org.mx/wp-content/uploads/2021/08/EventON-Cafe-Lit-2021_Individuales5-y-12-de-octubre.jpg", "https://www.marco.org.mx/wp-content/uploads/2021/08/EventON-Semana-de-arte-en-verano-1.png", "https://www.marco.org.mx/wp-content/uploads/2021/10/EvenTON-Conocimiento-y-Anti-conocimiento.png", "https://www.marco.org.mx/wp-content/uploads/2021/08/EvenTON-Invitacion-Sustentabilidad-1.png"]
    
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            //NavigationLink(
              //  destination: WebView(html: "https://www.museomarco.360s.mx/"),
                //label: {
                    
                    ScrollView{
                        VStack {
                            
                            Spacer(minLength: 25)
                            
                            
                            Text("EVENTOS")
                                //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                    
                                //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                                .padding()
                            
                            NavigationLink(
                                destination: EventosView(),
                                label: {
                                    AnimatedImage(url: URL(string: "https://www.marco.org.mx/wp-content/uploads/2021/08/EventON-Semana-de-arte-en-verano-1.png"))
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(10.0)
                                        .overlay(
                                            ZStack{
                                                Text("Eventos")
                                                    .font(.callout)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                    .padding(6)
                                                    .foregroundColor(.white)
                                            }.background(Color("RosaMarco"))
                                            .cornerRadius(10.0)
                                            .padding(6), alignment: .bottomLeading
                                        )
                                })
                
                            Spacer(minLength: 50)
                            
                            Text("TIENDA")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            NavigationLink(
                                destination: TiendaView(),
                                label: {
                                    Image("MarcoTienda")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: width, height: height/3)
                                        .overlay(
                                            ZStack{
                                                Text("Tienda")
                                                    .font(.callout)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                    .padding(6)
                                                    .foregroundColor(.white)
                                            }.background(Color("RosaMarco"))
                                            .cornerRadius(10.0)
                                            .padding(6), alignment: .bottomLeading
                                        )
                                        //.shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                        //.shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                                        .cornerRadius(0.1)
                                    
                                    
                                })
                            
                            Spacer()
                            
                            Text("EXPLORA")
                                .bold()
                                .padding()
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                                .background(Color("RosaMarco"))
                                .cornerRadius(25)
                                .frame(width: 200, height: 50, alignment: .center)

                            Group{
                                Text("Recorre las extraordinarias instalaciones de la expo más reciente del Museo y vive la experiencia de visitar MARCO desde cualquier parte.")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(20)
                                    //.scaledToFill()
                                    //.minimumScaleFactor(0.5)
                                    //.lineLimit(1)
                                    //.padding(.vertical, 20)
                            }
                            .padding(.horizontal, 30)
                            .padding(.vertical, 20)
                           
                            NavigationLink(
                                destination: WebView(html: "https://www.museomarco.360s.mx/"),
                                label: {
                                    Image("palomaMarco")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 400)
                                        .cornerRadius(10)
                                        .overlay(
                                            ZStack{
                                                Text("Recorrido Virtual")
                                                    .font(.callout)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                    .padding(6)
                                                    .foregroundColor(.white)
                                            }.background(Color("RosaMarco"))
                                            .cornerRadius(10.0)
                                            .padding(6), alignment: .bottomLeading
                                        )

                                })
                                .padding()
                            
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar(content: {
                                    ToolbarItem(placement: .principal, content: {
                                        Image("LogoMarco")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 20)
                                    })
                                })
                                .padding(20)
                            
                           
                        }//VSTACK
                    } // ScrollView
                }//ZSTACK
          //  )}//NavLink
    }
}

//
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
///Users/user189854/Desktop/AppMarco/AppMarco/AppMarco/Views/Web
//Images
/* ForEach(0...2, id: \.self){
    index in
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
        GeometryReader{reader in
            Image("\(String(index))")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .offset(x:-reader.frame(in:.global).minX)
                .frame(width: width, height: height/2)
                .cornerRadius(1)
                .overlay(ImageOverlay(),alignment: .center)
        }
        .frame(height: height/2)
        .padding(10)
        .background(Color.white)
        .cornerRadius(1)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
        
        
    })
    .padding(.horizontal,25)
    
}//ForEach EXPO

*/
