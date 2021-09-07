//
//  Map.swift
//  AppMarco
//
//  Created by user191983 on 9/6/21.
//

import SwiftUI
import MapKit

struct MapLocation:Identifiable{
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
