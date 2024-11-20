//
//  SummaryView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 19.11.24.
//

import SwiftUI

struct SummaryView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject
    var cartVm: CartViewModel


    var body: some View {
        VStack(alignment: .leading) {
            if !cartVm.showThx {
                SummaryBodyView()
            } else {
                SummaryThxView()
            }
            Spacer()
            HStack {
                Spacer()
                Button("Zurück") {
                    withAnimation{
                        cartVm.buttonPressed = false
                    }
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("Jetzt kaufen") {
                    cartVm.cartShirts = []
                    cartVm.orderReceived = true
                    cartVm.showThx = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        dismiss()
                        cartVm.showThx = false
                    }
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }.padding(.bottom, 64)
                .opacity(cartVm.showThx ? 0 : 1)
        }

    }
}

#Preview {
    SummaryView()
        .environmentObject(CartViewModel())
}
