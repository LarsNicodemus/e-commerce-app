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
                    .toolbarVisibility(.hidden)
                    .toolbarVisibility(.hidden, for: .tabBar)
            }
            Spacer()
            HStack {
                Spacer()
                Button("Zurück") {
                    cartVm.navigationPath.removeLast()
                }
                .buttonStyle(.borderedProminent)
                .opacity(cartVm.showThx ? 0 : 1)
                Spacer()
                Button("Jetzt kaufen") {
                    cartVm.cartShirts.removeAll()
                    cartVm.showThx = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        cartVm.navigationPath = NavigationPath()
                    }
                }
                .buttonStyle(.borderedProminent)
                .opacity(cartVm.showThx ? 0 : 1)
                Spacer()
            }.padding(.bottom, 64)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SummaryView()
        .environmentObject(CartViewModel())
}
