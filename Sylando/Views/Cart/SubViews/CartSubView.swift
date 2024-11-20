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
    var body: some View {
        if !cartVm.buttonPressed {
            withAnimation {
                CheckoutView()
                    .navigationBarBackButtonHidden(cartVm.showThx)
            }
        } else {
            withAnimation {
                SummaryView()
                    .navigationBarBackButtonHidden(cartVm.showThx)
            }
        }
        
    }
}

#Preview {
    CartSubView()
        .environmentObject(CartViewModel())
}
