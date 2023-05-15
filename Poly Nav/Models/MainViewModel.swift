//
//  MainViewModel.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import Foundation

struct ResponseData: Decodable {
    var campuses: [Campus]
}

class ViewModel: ObservableObject {
    @Published var campuses: [Campus] = []

    func loadBuildings() {
        if let url = Bundle.main.url(forResource: "Models/corpus.json", withExtension: nil) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                campuses = jsonData.campuses
            } catch {
                print("error: \(error)")
            }
        }
    }
}
