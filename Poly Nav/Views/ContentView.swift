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

    @State private var isGenPlan: Bool = false

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            VStack {
                CampusesView()
                
            }
            
            .tabItem {
                Image(systemName: "rectangle.grid.2x2.fill")
                Text("Корпуса")
            }
            .tag("Buildings")

            MapView( isGenPlan: $isGenPlan)
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
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//    }
// }
