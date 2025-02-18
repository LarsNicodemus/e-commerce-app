//
//  NavigatorView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct NavigatorView: View {
    @State private var selectedTab: TabSelection = .shirts
    @StateObject private var cartVm: CartViewModel = CartViewModel()
    var body: some View {
        TabView(selection: $selectedTab){
            Tab(TabSelection.shirts.rawValue, systemImage: TabSelection.shirts.icon, value: TabSelection.shirts){
                ShirtListView()
                    .environmentObject(cartVm)
                    .padding(.vertical)
            }
            Tab(TabSelection.cart.rawValue, systemImage: TabSelection.cart.icon, value: TabSelection.cart){
                CartView()
                    .environmentObject(cartVm)
                    .padding(.vertical)
            }
        }
    }
}

#Preview {
    NavigatorView()
}


