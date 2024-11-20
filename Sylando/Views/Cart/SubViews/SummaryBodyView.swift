//
//  SummaryBodyView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct SummaryBodyView: View {
    @EnvironmentObject
    var cartVm: CartViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack {
                Text("Zusammenfassung:")
                    .font(.system(size: 20,weight: .bold))
                    .padding(.top, 64)
                Spacer()
            }
            .padding(.bottom, 16)
            
            HStack{
                VStack{
                    Text("Bezeichnung").underline()
                    ForEach(cartVm.cartShirts, id: \.id) { shirt in
                        VStack {
                            Text(shirt.title)
                        }
                    }
                }
                Spacer()
                VStack{
                    Text("Größe").underline()
                    ForEach(cartVm.cartShirts, id: \.id) { shirt in
                        VStack {
                            Text(shirt.size)
                        }
                    }
                }
                Spacer()
                VStack{
                    Text("Preis").underline()
                    ForEach(cartVm.cartShirts, id: \.id) { shirt in
                        VStack {
                            Text(String(format: "%.2f €", shirt.price))
                        }
                    }
                }
            }
            .padding(.horizontal)
            HStack {
                Text("Gesamtpreis:")
                    .bold()
                Spacer()
                let totalPrice = Double(
                    cartVm.cartShirts.map { $0.price }.reduce(0.0, +))
                Text(String(format: "%.2f €", totalPrice))
                    .underline()
            }
            .padding(.trailing)
            .padding(.bottom, 60)
            
            HStack {
                Text("Name:")
                    .bold()
                    .padding(.trailing, 76)
                Text(cartVm.name)
            }
            .padding(.bottom, 16)
            
            HStack {
                VStack {
                    Text("Adresse:")
                        .bold()
                    Text(" ")
                }
                .padding(.trailing, 60)
                VStack(alignment: .leading) {
                    Text(cartVm.street)
                    Text(cartVm.city)
                }
            }
        }
    }
}

#Preview {
    SummaryBodyView()
        .environmentObject(CartViewModel())
}
