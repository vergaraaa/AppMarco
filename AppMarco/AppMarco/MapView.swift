//
//  MapView.swift
//  App01-Wonders
//
//  Created by user191983 on 8/17/21.
//
import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.6647, longitude: -100.3098),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    private var Locations = [
        MapLocation(name: "MARCO", coordinate: CLLocationCoordinate2D(latitude: 25.6647, longitude: -100.3098))
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: Locations){ location in
            MapMarker(coordinate: location.coordinate, tint: .red)
            //MapPin(coordinate: location.coordinate, tint: Color("RosaMarco"))
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
