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
    @State var building: Building?
<<<<<<< HEAD
    @Binding var isGenPlan: Bool
=======

>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5
    @State private var currentFloorId: Int = 1
    @State private var searchText: String = ""

    @GestureState private var scale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0

    var body: some View {
        VStack {
            if let building = building {
<<<<<<< HEAD
            ZStack{
                HStack{
                    if isGenPlan {
                        building.genPlanSvg
                            .aspectRatio(1.3, contentMode: .fit)
                    } else {
                        if let floor = building.floors.first(where: { $0.id == currentFloorId }){
                            floor.image

                        }else{
                            Text("Error")
                        }
                    }
                    
                    
                }
                
                VStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText)
                            .textFieldStyle(.plain)
                            
                            
                    }
                    .padding(.horizontal,10)
                    .frame(height: 48)
                    .background(Color.black)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 0.5)
                    })
                    .padding(.bottom,25)
=======
                ZStack {
                    HStack {
                        if let floor = building.floors.first(where: { $0.id == currentFloorId }) {
                            floor.image
                        } else {
                            Text("Error")
                        }
                    }
>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5

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

<<<<<<< HEAD
                    HStack{
                        VStack{
                            if !isGenPlan {
                                ForEach(building.floors){ floor in
                                    if currentFloorId == floor.id{
                                        
=======
                        HStack {
                            VStack {
                                ForEach(building.floors) { floor in
                                    if currentFloorId == floor.id {
>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5
                                        Text("\(floor.id)")
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .background(Color.accentColor)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
<<<<<<< HEAD
                                        
                                    }else{
                                        Button("\(floor.id)"){
=======

                                    } else {
                                        Button("\(floor.id)") {
>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5
                                            currentFloorId = floor.id
                                        }
                                        .buttonStyle(FloorButton())
                                    }
<<<<<<< HEAD
                                    
=======
>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5
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
        .onAppear{
            print(isGenPlan)
        }
    }
}

//
// struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
// }
