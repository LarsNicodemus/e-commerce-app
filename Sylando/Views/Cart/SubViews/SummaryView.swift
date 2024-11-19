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
    var showThx: Bool = false
    @Binding var buttonPressed: Bool

    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Zusammenfassung:")
                                .padding(.top, 64)
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Text("Bezeichnung").underline()
                            Spacer().frame(width: 60)
                            Text("Größe").underline()
                            Spacer()
                            Text("Preis").underline()
                        }
                        .padding(.horizontal)
                        
                        ForEach(cartVm.cartShirts, id: \.id) { shirt in
                            HStack {
                                Text(shirt.title)
                                Spacer()
                                Text(shirt.size)
                                Spacer()
                                Text(String(format: "%.2f €", shirt.price))
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Text("Gesamtpreis:")
                            Spacer()
                            let totalPrice = Double(cartVm.cartShirts.map { $0.price }.reduce(0.0, +))
                            Text(String(format: "%.2f €", totalPrice))
                                .underline()
                        }
                        .padding()
                        .padding(.bottom, 60)
                        
                        HStack {
                            Text("Name:")
                                .padding(.trailing, 76)
                            Text(cartVm.name)
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            VStack {
                                Text("Adresse:")
                                Text(" ")
                            }
                            .padding(.trailing, 60)
                            VStack(alignment: .leading) {
                                Text(cartVm.street)
                                Text(cartVm.city)
                            }
                        }
                        
                        Spacer()
                HStack{
                    Spacer()
                    Button("Zurück") {
                        buttonPressed = false
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                            Button("Jetzt kaufen") {
                                cartVm.cartShirts = []
                                cartVm.orderReceived = true
                                        dismiss()
                            }
                            .buttonStyle(.borderedProminent)
                    Spacer()
                }.padding(.bottom, 64)
                    }
        
    }
}

#Preview {
    SummaryView(buttonPressed: .constant(false))
        .environmentObject(CartViewModel())
}
