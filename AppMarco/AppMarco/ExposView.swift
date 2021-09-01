//
//  ExposView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct ExposView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Expos")
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
