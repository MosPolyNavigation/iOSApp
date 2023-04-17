//
//  MapView.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import SwiftUI
import SVGView

struct FloorButton: ButtonStyle{
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
    @State private var currentFloorId: Int = 1
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            if let building = building {
            ZStack{
                HStack{
                    if let floor = building.floors.first(where: { $0.id == currentFloorId }){
                        floor.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }else{
                        Text("Error")
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

                    

                    HStack{
                        VStack{
                            ForEach(building.floors){ floor in
                                if currentFloorId == floor.id{
                                   
                                    Text("\(floor.id)")
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .background(Color.accentColor)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                    
                                }else{
                                    Button("\(floor.id)"){
                                        currentFloorId = floor.id
                                    }
                                    .buttonStyle(FloorButton())
                                }
                                
                            }
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }.padding()
            }
        }
        
        else {
                Text("Loading")
                
            }
        }
    }
}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
