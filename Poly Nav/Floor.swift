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
    var image: SVGView {
        if let url = Bundle.main.url(forResource: imgUrl, withExtension: "svg", subdirectory: "buildings/pk"){
            return SVGView(contentsOf: url)
        }
        return SVGView(string: "")
    }
    

    
}

struct Building: Decodable, Identifiable {
    var abreviation: String
    var address: String
    var floors: [Floor]
    var id: String {abreviation}
}
