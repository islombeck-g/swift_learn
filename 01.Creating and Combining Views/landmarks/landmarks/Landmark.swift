//
//  Landmark.swift
//  landmarks
//
//  Created by Islombek Gofurov on 13.09.2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landark : Hashable, Codable{
    var id:Int
    var name:String
    var park:String
    var state:String
    var description:String
    
    private var imageName:String
    var image: Image {
            Image(imageName)
    }
    
    private var coordinates: Coordinates
       var locationCoordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(
               latitude: coordinates.latitude,
               longitude: coordinates.longitude)
       }
    
       struct Coordinates: Hashable, Codable {
           var latitude: Double
           var longitude: Double
       }
}
