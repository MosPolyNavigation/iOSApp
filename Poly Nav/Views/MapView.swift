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
            .background(.ultraThinMaterial)
            .foregroundColor(.secondary)
            .cornerRadius(6)
    }
}

struct MapView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    
    @Binding var isGenPlan: Bool
    
    @State private var currentFloorId: Int = 1
    @State private var searchText: String = ""
    
    @GestureState private var scale: CGFloat = 1.0
    
    @State private var totalZoom: CGFloat = 1.0
    @State private var currentZoom: CGFloat = 0.0
    var magnification: some Gesture {
        if #available(iOS 17.0, *){
            return  MagnifyGesture()
            
                .onChanged { value in
                    currentZoom = value.magnification - 1
                }
                .onEnded { value in
                    totalZoom += currentZoom
                    currentZoom = 0
                }
        
        }else{
            return MagnificationGesture()
                .updating($scale) { currentState, pastState, transaction in
                    pastState = currentState
                }
            
        }
    }
        
    var currentScale: CGFloat {
        if #available(iOS 17.0, *){ return (currentZoom + totalZoom) }else { return scale}
    }
    
    var body: some View {
        
        VStack {
            if let campus = vm.selectedCampus {
                if let building = vm.selectedBuilding {
                    ZStack {
                        HStack {
                            if isGenPlan {
                                campus.genPlanSvg
                                    .aspectRatio(1.3, contentMode: .fit)
                            } else {
                                if  let url = building.floors.first(where: {floor in floor.id == currentFloorId})?.image{
                                    
                                    SVGView(contentsOf: url)
                                        .scaleEffect(currentScale)
                                }else{
                                    Text("Plan isn't exist")
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
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.secondary, lineWidth: 1.5)
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
                    .gesture(
                            magnification
                        )
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
