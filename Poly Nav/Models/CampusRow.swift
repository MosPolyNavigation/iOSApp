//
//  BuildingRow.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import SwiftUI

struct CampusRow: View {
    var campus: Campus
    var openGenPlan: () -> Void

    var openBuilding: (_ id: Int) -> Void
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
            Text("\(campus.address)\(campus.address == "ул. Большая Семёновская, д. 38" ? "\n" : " ")(\(campus.abbreviation))")
                .padding(.top, 5)

            VStack {
                if isExpanded {
                    Divider()
                    Text("Общий план")
                        .padding(.vertical, 2)
                        .onTapGesture {
                            openGenPlan()
                            isExpanded = false
                        }
                    ForEach(campus.buildings) { building in
                        Divider()
                        Text("\(building.id) здание")
                            .onTapGesture {
                                openBuilding(building.id)
                                isExpanded = false
                            }
                    }
                }
            }
            .frame(height: isExpanded ? nil : 0, alignment: .leading)
            .clipped()
        }
        .frame(alignment: .leading)
        .onTapGesture {
            isExpanded.toggle()
        }
    }
}
