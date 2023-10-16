//
//  BuildingsView.swift
//  Poly Nav
//
//  Created by Михаил on 15.10.2023.
//

import SwiftUI

struct BuildingsView: View {
    
    @State var campus: Campus
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationView{
            List(campus.buildings, id: \.id) { building in

                Text("Здание \(building.id)")
                    .onTapGesture {
                        vm.selectBuilding(campus: campus, building: building)
                    }
            }.navigationTitle(campus.abbreviation)
        }
    }
}
