//
//  TiendaView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct TiendaView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Tienda")
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

struct TiendaView_Previews: PreviewProvider {
    static var previews: some View {
        TiendaView()
    }
}
