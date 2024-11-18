//
//  CartView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationStack {
                    List() {
                    }
                    .navigationTitle("Shopping Cart")
            
                NavigationLink(destination: {
                    CheckOutView()
                }, label: {
                    Text("Check Out")
                }).buttonStyle(.borderedProminent)
                }
    }
}

#Preview {
    CartView()
}
