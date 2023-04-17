//
//  BuildingRow.swift
//  Poly Nav
//
//  Created by Михаил on 17.04.2023.
//

import SwiftUI

struct BuildingRow: View {
    var building: Building
    
    
    var body: some View {
        HStack{
            Text(building.address)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .padding(.horizontal)
        

        .cornerRadius(10)
    }
}

//struct BuildingRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingRow()
//    }
//}
