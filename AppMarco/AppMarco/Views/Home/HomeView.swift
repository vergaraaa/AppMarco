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
    var arrImages = ["MarioGarciaTorres", "MarcoTienda", "Eventos-1", "index"]
    
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            //NavigationLink(
              //  destination: WebView(html: "https://www.museomarco.360s.mx/"),
                //label: {
                    
                    ScrollView{
                        VStack {
                            
                            Spacer(minLength: 25)
                            
                            
                            Text("EXPOSICIONES ACTUALES")
                                //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                                .padding()
                            
                            //GeometryReader { proxy in
                            
                                TabView {
                                   
                                    ForEach(0..<arrImages.count, id: \.self){ item in
                                        Image(arrImages[item])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 400, height: 350)
                                            .padding()
                                            
                                    }
                                    
                                }.tabViewStyle(PageTabViewStyle())
                                .frame(width: 400, height: 180)
                                /*.clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding()
                                .frame(width: proxy.size.width, height: proxy.size.height / 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }*/

                            
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
                            Divider()
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
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                                        .cornerRadius(0.1)
                                    
                                    
                                })
                            Spacer()
                            
                            Text("EVENTOS")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            NavigationLink(
                                destination: WebView(html: "https://www.marco.org.mx/noticias/"),
                                label: {
                                    Image("Eventos-1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: width, height: height/3)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                                        .cornerRadius(0.1)
                                    
                                    
                                })
                            
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
