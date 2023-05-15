//
//  MainViewModel.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import Foundation

struct ResponseData: Decodable {
    var buildings: [Building]
}

class ViewModel: ObservableObject {
    @Published var buildings: [Building] = []

    func loadBuildings() {
        if let url = Bundle.main.url(forResource: "corpus.json", withExtension: nil) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                buildings = jsonData.buildings
            } catch {
                print("error: \(error)")
            }
        }
    }
}
