//
//  Enums.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

enum TabSelection: String,  Identifiable, CaseIterable {
    case shirts = "T-Shirts"
    case cart = "Warenkorb"
    
    var id: String {
            self.rawValue
        }
    
    var icon: String {
            switch self {
                case .shirts: return "tshirt.fill"
                case .cart: return "cart.fill"
            }
        }
}
