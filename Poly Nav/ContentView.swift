//
//  ContentView.swift
//  Poly Nav
//
//  Created by Михаил on 16.04.2023.
//

import SwiftUI
import SVGView
struct BuildingButton: ButtonStyle{
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
    @State private var selectedTab = "Корпуса"

    var body: some View {
       
        TabView(selection: $selectedTab){
            List{
                ForEach(viewModel.buildings){ building in
                    Text("\(building.address)").onTapGesture {
                        selectedBuilding = building
                        selectedTab = "Routes"
                    }
                }
            }
            .listStyle(.insetGrouped)
            .tabItem {
                    Image(systemName: "rectangle.grid.2x2.fill")
                    Text("Корпуса")
                }
            .tag("Buildings")


            MapView(building: selectedBuilding)
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
        .onAppear{
            viewModel.loadBuildings()
            selectedBuilding = viewModel.buildings.first!
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//    }
//}
