//
//  CampusesView.swift
//  Poly Nav
//
//  Created by Михаил on 15.10.2023.
//

import SwiftUI

struct CampusesView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView{
            List(viewModel.campuses, id: \.id) { campus in
                NavigationLink {
                    BuildingsView( campus: campus )
                } label: {
                    Text(campus.address)
                }
                
    
            }.navigationTitle("Корпуса")
        }
       
    }
}
