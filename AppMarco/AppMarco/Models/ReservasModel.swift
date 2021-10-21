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

struct GuideModel : Decodable, Encodable {
    var id : String
    var name : String
    var email : String
}

struct ReservasModel : Identifiable, Decodable, Encodable {
    
    var id  : String
    var date : Date
    var hour : String
    var user: String
    //var idG : String
    var guide: GuideModel
    var spots: Int
    var available : Bool
    
    enum CodingKeys : String, CodingKey{
        case id = "_id"
        case date
        case hour
        case user
        case guide
        case spots
        case available
    }
}


