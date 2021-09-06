//
//  ExpoModel.swift
//  AppMarco
//
//  Created by user189854 on 9/5/21.
//

import SwiftUI

class ExpoModel: ObservableObject{
    @Published var arrExpos = [Expos]()
    
    init(){
        LoadInfo()
    }
    func LoadInfo(){
        var expo : Expos
        
        expo = Expos(sNombre: "La Poetica del Regreso", sAutor: "Mario Garcia Torres", sFecha: "12 de Marzo - 21 de Agosto 2021", arrImages: ["MarioGraciaTorres"])
        
        arrExpos.append(expo)
        
        expo = Expos(sNombre: "Index", sAutor: "MARCO y FF Projects", sFecha: "16 de Octubre 2020 - Agosto 2021", arrImages: ["index"])
        arrExpos.append(expo)
    }
}
