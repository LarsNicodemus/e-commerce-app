//
//  CheckOutView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct CartSubView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject
    private var cartVm: CartViewModel
    @State private var showError = false
    @State var buttonPressed = false
    var body: some View {
        if !buttonPressed {
            CheckoutView(showError: $showError, buttonPressed: $buttonPressed)
        } else {
            SummaryView(buttonPressed: $buttonPressed)
        }
    }
}

#Preview {
    CartSubView()
        .environmentObject(CartViewModel())
}
