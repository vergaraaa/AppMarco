//
//  BoletosView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct BoletosView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Boletos")
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

struct BoletosView_Previews: PreviewProvider {
    static var previews: some View {
        BoletosView()
    }
}
