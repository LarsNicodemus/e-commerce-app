//
//  ShirtsViewModel.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//
import SwiftUI


@MainActor
class ShirtsViewModel: ObservableObject {
    
    @Published var shirts: [Shirt] = [
        Shirt(title: "Shirt1", price: 14.99, size: "M"),
        Shirt(title: "Shirt2", price: 18.99, size: "L"),
        Shirt(title: "Shirt3", price: 20.99, size: "S")
    ]
}
