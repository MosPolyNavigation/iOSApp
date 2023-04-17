//
//  Poly_NavApp.swift
//  Poly Nav
//
//  Created by Михаил on 16.04.2023.
//

import SwiftUI

@main
struct Poly_NavApp: App {
    @StateObject var state = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
        }
    }
}
