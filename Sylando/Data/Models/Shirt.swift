//
//  Shirt.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//
import Foundation

struct Shirt: Identifiable, Codable {
    var id: UUID
    var title: String
    var price: Double
    var size: String
    
    init(id: UUID = UUID(), title: String, price: Double, size: String) {
        self.id = id
        self.title = title
        self.price = price
        self.size = size
    }
}
