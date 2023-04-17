//
//  Floor.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import Foundation
import SwiftUI
import SVGView

struct Floor: Identifiable, Decodable {
    var imgUrl: String
    var id: Int
    var image: Image {
        Image(imgUrl)
    }
    

    
}

struct Building: Decodable, Identifiable {
    var abreviation: String
    var address: String
    var floors: [Floor]
    var id: String {abreviation}
}
