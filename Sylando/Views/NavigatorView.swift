//
//  NavigatorView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct NavigatorView: View {
    @State private var selectedTab: TabSelection = .shirts
    var body: some View {
        TabView(selection: $selectedTab){
            Tab(TabSelection.shirts.rawValue, systemImage: TabSelection.shirts.icon, value: TabSelection.shirts){
                ShirtListView()
                    .padding()
            }
            Tab(TabSelection.cart.rawValue, systemImage: TabSelection.cart.icon, value: TabSelection.cart){
                CartView()
                    .padding()
            }
        }
        
    }
}

#Preview {
    NavigatorView()
}


