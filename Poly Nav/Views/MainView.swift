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
                ZStack {
                    WebView(url: url, isLoading: $isLoading)
                        .edgesIgnoringSafeArea(.all)
                    if self.isLoading {
                        Rectangle()
                            .background(Color.black)
                        Image("SplashIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {

                    }
                }
                
            }
        }
    }
}
