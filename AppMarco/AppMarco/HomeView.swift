//
//  Home.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Home")
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
