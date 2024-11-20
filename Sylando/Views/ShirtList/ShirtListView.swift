//
//  ShirtListView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct ShirtListView: View {
    @StateObject private var vm = ShirtsViewModel()
    @EnvironmentObject
    private var cartVm: CartViewModel
    var body: some View {
        NavigationStack {
            VStack {

                List(vm.shirts) { shirt in
                    ShirtListRowView(shirt: shirt, shirtVm: vm)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .toolbar {
                    Button("Neues Shirt") {
                        vm.isPresented = true
                    }.buttonStyle(.borderedProminent)
                }

                .sheet(isPresented: $vm.isPresented) {
                    ShirtAddView(shirtVm: vm)
                        .interactiveDismissDisabled(false)
                }
            }
            .navigationTitle("Shirts")

        }
        
    }
    
}
#Preview {
    ShirtListView()
        .environmentObject(CartViewModel())
}
