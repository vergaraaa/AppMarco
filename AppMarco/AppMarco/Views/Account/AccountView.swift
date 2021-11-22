//
//  AccountView.swift
//  AppMarco
//
//  Created by user191983 on 9/23/21.
//

import SwiftUI

struct AccountView: View {
//    @Binding var name: String
    @State var offset: CGFloat = 0
    @State var tabIndex = 0
    @Environment(\.colorScheme) var colorScheme
    @State var currentTab = "FavoritosView"
    
    @State var titleOffset: CGFloat = 0
    
    var ColorR = Color("RosaMarco")
    //slider animation
    @Namespace var animation
    @State var tabBarOffset: CGFloat = 0
    @State var reservas = [ReservasModel]()
    
    var name : String = UserDefaults.standard.string(forKey: "name") ?? ""
    var lastname : String = UserDefaults.standard.string(forKey: "lastname") ?? ""
    var email : String = UserDefaults.standard.string(forKey: "email") ?? ""
    
    @EnvironmentObject var loginVM : LoginViewModel
    var body: some View{
    
        ScrollView(.vertical, showsIndicators: false,
            content: {
                //flta line spacing aqui
                VStack{
                    Color("BgVeige")
                
                    //header view
                    GeometryReader{proxy -> AnyView in
                        
                        //sticky header
                        let minY = proxy.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        return AnyView(
                        
                            ZStack{
                                
                                //banner
                                Image("marcoBanner")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0 ? 180 + minY:180, alignment: .center)
                                    .cornerRadius(0)
                                
                                BlurView()
                                    .opacity(blurViewOpacity())
                                
                                //title view
//                                VStack(spacing: 4){
//                                    Text("Edgar")
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//
//                                    Text("4 Expos Likeadas")
//                                        .foregroundColor(.white)
//
//                                }
//                                .offset(y: 120)
//                                .offset(y:titleOffset > 60 ? 0 : getTitleTextOffset())
//                                .opacity(titleOffset < 60 ? 1 :0)
                                
                            }
                            //.clipped()
                            //stretch header
                            .frame(height:minY > 0 ? 180 + minY:nil)
                            .offset(y:minY > 0 ? -minY : -minY < 80 ? 0: -minY - 80)
                        )
                    }
                    .frame(height: 180)
                    .zIndex(1)
                    
                    //Profile Image
                    VStack{
                        HStack{
                            Image("2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Rectangle())
                                .padding(8)
                                //.background()
                                .clipShape(Rectangle())
                                .border(Color.black, width: 8)
                                .offset(y: offset < 0 ? getOffset() - 20: -20)
                                .scaleEffect(getScale())
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text(name + " " + lastname )
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text(email)
                                    .foregroundColor(.gray)
                            })
                                
                            Button(action: {
                                loginVM.logout()
                                }, label: {
                                Text("Sign Out")
                                    .foregroundColor(Color("RosaMarco"))
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule()
                                    .stroke(ColorR,lineWidth: 1))
                            })
                        }
                        
                        VStack{
                            CustomTopTabBar(tabIndex: $tabIndex)
                            if tabIndex == 0 {
                                FavoritosView()
                                    .scaledToFill()
                                
                            }
                            else {
                                ListaReservaView()
                                    
                                    
                                    
                            }
                        }
                        
                        //.padding(.top,-25)
                        //.padding(.bottom, -10)
                        //Profile Data
                        
//                        VStack(alignment: .leading, spacing: 8, content: {
//
//
//
//                        })
                        
                        
                        //menusito
                        VStack(spacing:0){
                            
                            /*
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                /*
                                HStack(spacing:5){
                                    TabButton(title: "Exposiciones Favoritas", currentTab: $currentTab, animation: animation)
                                        .foregroundColor(ColorR)
                                    TabButton(title: "Mis visitas", currentTab: $currentTab, animation: animation)
                                }*/
                                
                            })*/
                            Divider()
                        }
                        .padding(.top,30)
                       // .background(Color("BgVeige"))
                        //editable
                        .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 :0)
                        .overlay (
                            
                            GeometryReader{reader -> Color in
                                    
                                let minY = reader.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.tabBarOffset = minY
                                }
                                
                                
                                return Color.clear
                            }
                            .frame(width: 0, height: 0)
                            ,alignment: .top
                        
                        )
                        .zIndex(1)
                        
                        VStack(spacing: 18){
                            
                            //expos ejemplo
                            
                            //FavoritosView()
                              //  .scaledToFill()
                            
                        }
                        .padding(.top)
                        .zIndex(0)
                        /*
                        VStack(spacing:18){
                            
                            ListaReservaView()
                            //VisGuiadaView()
                        }*/
                           
                    }
                    .padding(.horizontal)
                    //por si se pasa arriba
                    .zIndex(-offset > 80 ? 0 :1)
                }
            })
            .ignoresSafeArea(.all, edges:.top)
        
            
    }
    
    func getTitleTextOffset() -> CGFloat{
        
        let progress = 20 / titleOffset
        
        let offset = 60 * (progress > 0 && progress <= 1 ? progress :1)
        return offset
    }
    
    
    func getOffset()->CGFloat{
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress :20
    }
    
    func getScale() ->CGFloat {
        let progress = -offset / 80
        
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale :1
    }
    
    func blurViewOpacity() -> Double{
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
        
        /*
        
        ZStack{
            Color("BgVeige")
            
            VStack{
                Text("Nombre: ")
//                    TextField("Nombre: ")
                
                Button(action: {
                    loginVM.logout()
                }, label: {
                    Text("Sign out")
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Image("LogoMarco")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                })
            })
            
        }
        
    }
 
    */
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}

//tab button

struct TabButton: View{
    var title:String
    @Binding var currentTab:String
    var animation:Namespace.ID
    var body: some View{
        Button(action:{
            currentTab = title
        }, label: {
            
            //lazy stack para ver texto completo
            LazyVStack(spacing: 12){
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .pink : .gray)
                    .padding(.horizontal)
                if currentTab == title{
                    Capsule()
                        .fill(Color.pink)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                else{
                    Capsule()
                        .fill(Color.clear)
                        .frame(height:1.2)
                }
            }
        })
    }
}

    struct VisGuiadaView: View {
        var note: String
        var boletoImg: String?
        var body: some View {
            
            HStack(alignment: .top, spacing: 10, content: {
                Image("boleto")
                    .resizable()
                    .aspectRatio(contentMode:  .fill)
                    .frame(width:55, height:55)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading, spacing: 10, content: {
                    (
                        Text("La noche bonita")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        
                        Text("@MarcoAntonioSolis")
                            .foregroundColor(.gray)
                    
                    )
                    Text(note)
                        .frame(maxHeight: 100, alignment: .top)
                    
                   
                    if let image = boletoImg{
                        GeometryReader{
                            proxy in
                            
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width, height: 250)
                                .cornerRadius(1)
                        }
                        .frame(height:250 )
                    }
                })
            })
        
        }
    }
struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 25) {
                TabBarButton(text: "Mis Expos", isSelected: .constant(tabIndex == 0))
                    .foregroundColor(Color("RosaMarco"))
                    .onTapGesture { onButtonTapped(index: 0) }
                TabBarButton(text: "Mis Visitas", isSelected: .constant(tabIndex == 1))
                    .foregroundColor(Color("RosaMarco"))
                    .onTapGesture { onButtonTapped(index: 1) }
            }
        
        })
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .padding(.bottom,10)
 
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: SwiftUI.Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

