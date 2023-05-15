//
//  MapView.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import SVGView
import SwiftUI

struct FloorButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 40, height: 40, alignment: .center)
            .background(.ultraThickMaterial)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
}

struct MapView: View {
    @State var selectedBuilding: Int = 1
    @State var campus: Campus?

    @Binding var isGenPlan: Bool

    @State private var currentFloorId: Int = 1
    @State private var searchText: String = ""

    @GestureState private var scale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0

    var body: some View {
        VStack {
            if let campus = campus {
                var building = campus.buildings[selectedBuilding - 1]
                ZStack {
                    HStack {
                        if isGenPlan {
                            campus.genPlanSvg
                                .aspectRatio(1.3, contentMode: .fit)
                        } else {
                            if let floor = building.floors.first(where: { $0.id == currentFloorId }) {
                                floor.image

                            } else {
                                Text("Error")
                            }
                        }
                    }
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: $searchText)
                                .textFieldStyle(.plain)
                        }
                        .padding(.horizontal, 10)
                        .frame(height: 48)
                        .background(Color.black)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 0.5)
                        })
                        .padding(.bottom, 25)

                        HStack {
                            VStack {
                                if !isGenPlan {
                                    ForEach(building.floors) { floor in
                                        if currentFloorId == floor.id {
                                            Text("\(floor.id)")
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .background(Color.accentColor)
                                                .foregroundColor(.white)
                                                .cornerRadius(6)

                                        } else {
                                            Button("\(floor.id)") {
                                                currentFloorId = floor.id
                                            }
                                            .buttonStyle(FloorButton())
                                        }
                                    }
                                }
                            }

                            Spacer()
                        }
                        Spacer()
                    }.padding()
                }
            } else {
                Text("Loading")
            }
        }
    }
}

//
// struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
// }
