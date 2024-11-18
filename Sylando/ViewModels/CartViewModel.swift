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
}
