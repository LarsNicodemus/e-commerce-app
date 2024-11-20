//
//  CartView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject
    private var cartVm: CartViewModel
    var body: some View {
        NavigationStack {
            List(cartVm.cartShirts) { shirt in
                CartListRowView(shirt: shirt)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Shopping Cart")

            NavigationLink("Check Out") {
                CartSubView()
            }
            .padding(.bottom, 64)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
