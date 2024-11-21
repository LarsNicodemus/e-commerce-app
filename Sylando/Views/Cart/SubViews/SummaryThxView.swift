//
//  SummaryThxView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct SummaryThxView: View {
    @EnvironmentObject
    var cartVm: CartViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Spacer()
            Text("\(cartVm.name), vielen Dank für dein Vertrauen!")
                .font(.system(size: 20))
                .bold()
            Text("Wir werden deine Bestellung umgehen versenden und dich per Mail über den Stand informieren.")
            Text("Wenn du zufrieden bist, freuen wir uns über eine Bewertung von dir.")
            Image("121")
                .resizable()
                .scaledToFit()
            Spacer()
        }
    }
}

#Preview {
    SummaryThxView()
        .environmentObject(CartViewModel())
}
