//
//  Floor.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import Foundation
import SVGView
import SwiftUI

struct Floor: Identifiable, Decodable {
    var imgUrl: String
    var id: Int
    var image: URL? {
        if let url = Bundle.main.url(forResource: imgUrl, withExtension: "svg", subdirectory: "buildings/avt") {
            return url
        }
        return nil
        
    }
}

struct Campus: Decodable, Identifiable {
    var abbreviation: String
    var address: String
    var genPlanUrl: String
    var buildings: [Building]

    var genPlanSvg: SVGView {
        if let url = Bundle.main.url(forResource: genPlanUrl, withExtension: "svg", subdirectory: "buildings/avt") {
            return SVGView(contentsOf: url)
        }
        return SVGView(string: "")
    }

    var id: String { abbreviation }
}

struct Building: Decodable, Identifiable {
    var id: Int
    var floors: [Floor]
}
