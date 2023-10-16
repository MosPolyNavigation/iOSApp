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
    
    
    @Published var selectedTab = "Buildings"
    @Published var selectedCampus: Campus?
    @Published var selectedBuilding: Building?
    
    func loadBuildings() {
        if let url = Bundle.main.url(forResource: "corpus.json", withExtension: nil) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                campuses = jsonData.campuses
                selectedCampus = campuses.first
                selectedBuilding = campuses.first?.buildings.first
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    
    func selectBuilding(campus: Campus, building: Building){
        selectedBuilding = building
        selectedCampus = campus
        selectedTab = "Routes"
    }
}
