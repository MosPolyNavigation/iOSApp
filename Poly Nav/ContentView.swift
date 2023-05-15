//
//  ContentView.swift
//  Poly Nav
//
//  Created by Михаил on 16.04.2023.
//

import SVGView
import SwiftUI

struct BuildingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 40, height: 40, alignment: .center)
            .background(.ultraThickMaterial)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var selectedBuilding: Building?
    @State private var isGenPlan: Bool = false
    @State private var selectedTab = "Корпуса"
    
    @State private var searchText: String = ""
    
    var body: some View {
        TabView(selection: $selectedTab) {
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
                
                List {
                    ForEach(viewModel.buildings) { building in
                        HStack{
                            
                            Text("\(building.address) (\(building.abbreviation))").onTapGesture {
                                print(building)
                                selectedBuilding = building
                                selectedTab = "Routes"
                                print(building)
                            }
                            
                            Spacer()
                            
                            Text("Общ. план").onTapGesture {
                                print("plan")
                                selectedBuilding = building
                                selectedTab = "Routes"
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .tabItem {
                Image(systemName: "rectangle.grid.2x2.fill")
                Text("Корпуса")
            }
            .tag("Buildings")
            
            MapView(building: selectedBuilding, isGenPlan: $isGenPlan)
                .tabItem {
                    Image(systemName: "map")
                    Text("Маршруты")
                }
                .tag("Routes")
            
            Text("О Нас")
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("О Нас")
                }
        }
        .onAppear {
            viewModel.loadBuildings()
            selectedBuilding = viewModel.buildings.first!
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//    }
// }
