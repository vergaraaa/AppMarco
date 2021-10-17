//
//  ExposFavoritas+CoreDataProperties.swift
//  AppMarco
//
//  Created by Eugenio Peña García on 17/10/21.
//
//

import Foundation
import CoreData


extension ExposFavoritas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExposFavoritas> {
        return NSFetchRequest<ExposFavoritas>(entityName: "ExposFavoritas")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var author: String?
    @NSManaged public var startDate: String?
    @NSManaged public var endDate: String?
    @NSManaged public var desc: String?
    @NSManaged public var virtualTourURL: String?
    @NSManaged public var authorCapsuleURL: String?
    @NSManaged public var images: [String]?
    @NSManaged public var curatorship: String?
    @NSManaged public var museography: String?
    @NSManaged public var location: String?
    @NSManaged public var technique: String?
    @NSManaged public var totalPieces: String?

}

extension ExposFavoritas : Identifiable {
    
    var id_wrapped : String {id ?? " "}
    var name_wrapped : String {name ?? " "}
    var author_wrapped : String {author ?? " "}
    var startDate_wrapped : String {startDate ?? " "}
    var endDate_wrapped : String {endDate ?? " "}
    var desc_wrapped : String {desc ?? " "}
    var virtualTourURL_wrapped : String {virtualTourURL ?? " "}
    var authorCapsuleURL_wrapped : String {authorCapsuleURL ?? " "}
    var images_wrapped : [String] {images ?? ["logo.jpg"]}
    var curatorship_wrapped : String {curatorship ?? " "}
    var museography_wrapped : String {museography ?? " "}
    var location_wrapped : String {location ?? " "}
    var technique_wrapped : String {technique ?? " "}
    var totalPieces_wrapped : String {totalPieces ?? " "}
    

}
