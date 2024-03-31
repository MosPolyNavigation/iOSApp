//
//  MainView.swift
//  Poly Nav
//
//  Created by Михаил on 10.03.2024.
//

import SwiftUI
import WebKit

struct MainView: View {
    @State private var isLoading = true
    let url: URL?

    var body: some View {
        ZStack{
            if let url = url{
                WebView(url: url, isLoading: $isLoading)
                    .edgesIgnoringSafeArea(.all)
                if isLoading{
                    ProgressView()
                }
            }
        }
    }
}
