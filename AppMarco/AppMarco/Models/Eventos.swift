//
//  Eventos.swift
//  AppMarco
//
//  Created by user189854 on 10/17/21.
//

import SwiftUI

struct EventosResponse : Codable {
    var eventos : [Eventos]
}

struct Eventos : Codable, Identifiable {
    
    var id: String
    var name: String
    var author: String
    var startDate: String
    var description: String
    var image: String
    var hour: String
    var location: String
    var organizer: String
        
    enum CodingKeys: String, CodingKey{
        case id = "_id"
        case name
        case author
        case startDate
        case description
        case image
        case hour
        case location
        case organizer
    }
}



