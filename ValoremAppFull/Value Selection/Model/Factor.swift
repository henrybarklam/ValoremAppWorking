//
//  Value.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 7/14/21.
//
import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Factor: Identifiable, Codable{
//    @DocumentID var id: String?
    var id : Int
    var name : String
    var selected : Bool
    
    @ServerTimestamp var createdTime: Timestamp?
//    var subname: String
//
//    private var imageName: String
//    var image : Image{
//        Image(imageName)
//    }
//    var iconimageunchecked: String
//    var iconimagechecked: String
}

#if DEBUG
let testDataFactors = [
    Factor(id: 1, name: "Clean Water", selected: false),
    Factor(id: 2, name: "Good Power", selected: true),
    Factor(id: 3, name: "Racil Equity", selected: false)
]
#endif

