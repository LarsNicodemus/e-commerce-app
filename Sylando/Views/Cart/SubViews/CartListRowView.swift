//
//  CartListRowView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct
CartListRowView: View {
    var shirt: Shirt
    @EnvironmentObject
    private var cartVm: CartViewModel
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text(shirt.title)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                }
                HStack{
                    Text("Größe:")
                    Text(shirt.size)
                    Spacer()
                    Text("Preis:")
                    Text(String(format: "%.2f €", shirt.price))
                }
                
            }
            .padding()
            .background(.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            ZStack{
                Image(systemName: "tshirt.fill")
                    .font(.system(size: 60))
                    .fontWeight(.ultraLight)
                    .foregroundStyle(shirt.color)
                    .overlay(
                        Image(systemName: "tshirt")
                            .font(.system(size: 60))
                            .fontWeight(.ultraLight)
                            .foregroundStyle(.black)
                    )
                if let quote = shirt.quoteText{
                    Text(quote)
                        .font(.system(size: 3))
                        .bold()
                        .frame(width: 30)
                        .foregroundColor(shirt.quoteTextColor)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .swipeActions {
            Button(role: .destructive) {
                cartVm.deleteShirt(shirt)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

        }
    }
    
}

#Preview {
    CartListRowView(shirt: Shirt(title: "Best Shirt Ever", price: 20.99, size: "M"))
}
