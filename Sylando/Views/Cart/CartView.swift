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
        NavigationStack(path: $cartVm.navigationPath) {
                    VStack {
                        if cartVm.cartShirts.isEmpty {
                            Spacer()
                            Text("Dein Warenkorb ist leer.")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding()
                            Spacer()
                        } else {
                            List(cartVm.cartShirts) { shirt in
                                CartListRowView(shirt: shirt)
                                    .listRowSeparator(.hidden)
                            }
                            .listStyle(.plain)
                        }

                        NavigationLink("Check Out", value: checkoutviews.checkoutview)
                            .padding(.bottom, 64)
                            .buttonStyle(.borderedProminent)
                            .disabled(cartVm.cartShirts.isEmpty)
                    }
                    .navigationTitle("Shopping Cart")
                    .navigationDestination(for: checkoutviews.self) { view in
                        switch view {
                        case .checkoutview:
                            CheckoutView()
                        case .summaryview:
                            SummaryView()
                        default:
                            EmptyView() 
                        }
                    }
                }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
