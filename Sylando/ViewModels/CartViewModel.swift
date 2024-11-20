//
//  CartViewModel.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//
import SwiftUI

@MainActor
class CartViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var street: String = ""
    @Published var city: String = ""
    @Published var cartShirts: [Shirt] = [
//        Shirt(title: "Shirt1", price: 14.99, size: "M"),
//        Shirt(title: "Shirt2", price: 18.99, size: "L"),
//        Shirt(title: "Shirt3", price: 20.99, size: "S")
    ]
    @Published var orderReceived: Bool = false
    @Published var showError: Bool = false
    @Published var buttonPressed: Bool = false
    @Published var showThx: Bool = false
    func deleteShirt(_ shirt: Shirt) {
        guard let index = cartShirts.firstIndex(where: { $0.id == shirt.id }) else { return }
        cartShirts.remove(at: index)
    }
}
