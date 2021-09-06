//
//  ExposView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct ExposView: View {
    
    @StateObject var expo = ExpoModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Exposiciones")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                VStack{
                    ForEach(expo.arrExpos){item in
                        VStack{
                            Image(item.arrImages[0])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            
                            Text(item.sNombre)
                                .font(.title2)
                            Text(item.sAutor)
                                .font(.title3)
                            
                        }
                    }
                }
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
}

struct ExposView_Previews: PreviewProvider {
    static var previews: some View {
        ExposView()
    }
}
