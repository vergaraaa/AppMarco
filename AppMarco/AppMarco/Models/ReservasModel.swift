//
//  ReservasModel.swift
//  AppMarco
//
//  Created by user195902 on 10/20/21.
//

import SwiftUI
struct ReservasResponse : Decodable, Encodable {
    var reservation : [ReservasModel]
    
}

struct ReservasModel : Identifiable, Decodable, Encodable {
    
    var id  : String
    var fecha : Date
    var hora : String
    var usuario: String
    //var idG : String
    var guia: String
    var canPer: Int
    
    
    enum CodingKeys : String, CodingKey{
        case id = "_id"
        case fecha
        case hora
        case usuario
        case guia
        case canPer
    }
}
