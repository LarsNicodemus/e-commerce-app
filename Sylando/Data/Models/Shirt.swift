//
//  Shirt.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//
import SwiftUI

struct Shirt: Identifiable {
    var id: UUID = UUID()
    var title: String
    var price: Double
    var size: String
    var color: Color
    var quoteText: String?
    var quoteTextColor: Color
    
    init(title: String, price: Double, size: String, color: Color = .black, quoteText: String? = nil, quoteTextColor: Color = .white) {
        self.title = title
        self.price = price
        self.size = size
        self.color = color
        self.quoteText = quoteText
        self.quoteTextColor = quoteTextColor
    }
}
