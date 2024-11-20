//
//  ShirtCardView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct
ShirtListRowView: View {
    var shirt: Shirt
    @ObservedObject var shirtVm: ShirtsViewModel
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
            Image(systemName: "tshirt.fill")
                .resizable()
                .frame(width: 60, height: 60)
        }
        .swipeActions {
            Button{
                cartVm.cartShirts.append(shirt)
                                    } label: {
                                        Label("Add", systemImage: "cart.fill")
                                    }
                                    .tint(.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

            Button(role: .destructive) {
                shirtVm.deleteShirt(shirt)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

        }
    }
    
}

#Preview {
    ShirtListRowView(shirt: Shirt(title: "Best Shirt Ever", price: 20.99, size: "M"), shirtVm: ShirtsViewModel())
}
