//
//  CartView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject
    private var cartVm: CartViewModel
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
                    List(cartVm.cartShirts) { shirt in
                        Text(shirt.title)
                    }
                    .navigationTitle("Shopping Cart")
                    
                    Button("Check Out") {
                        path.append("CheckOut")
                        print(path.count)
                        print(path)
                    }
                    .buttonStyle(.borderedProminent)
                    .navigationDestination(for: String.self) { destination in
                        if destination == "CheckOut" {
                            CheckOutView(path: $path)
                        }
                    }
                    
                }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
