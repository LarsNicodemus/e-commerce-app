//
//  Enums.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//
import SwiftUI

enum TabSelection: String, Identifiable, CaseIterable {
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

enum Size: String, Identifiable, CaseIterable {
    case xs, s, m, l, xl

    var id: String { rawValue }

    var title: String {
        switch self {
        case .xs: "XS"
        case .s: "S"
        case .m: "M"
        case .l: "L"
        case .xl: "XL"
        }
    }
}

enum HTTPError: Error {
    case invalidURL, fetchFailed

    var message: String {
        switch self {
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Laden ist fehlgeschlagen"
        }
    }
}

enum checkoutviews: String, Identifiable, CaseIterable {
    case cartview = "Cart"
    case checkoutview = "Checkout"
    case summaryview = "Summary"
    case summarythxview = "SummaryThanks"

    var id: String {
        self.rawValue
    }
}

enum ColorPick: Identifiable, CaseIterable {
    case red, blue, yellow, green, teal, brown, black, white, purple

    var id: String {
        self.description
    }

    var color: Color {
        switch self {
        case .red: return .red
        case .blue: return .blue
        case .yellow: return .yellow
        case .green: return .green
        case .teal: return .teal
        case .brown: return .brown
        case .black: return .black
        case .white: return .white
        case .purple: return .purple
        }
    }

    var description: String {
        switch self {
        case .red: return "Red"
        case .blue: return "Blue"
        case .yellow: return "Yellow"
        case .green: return "Green"
        case .teal: return "Teal"
        case .brown: return "Brown"
        case .black: return "Black"
        case .white: return "White"
        case .purple: return "Purple"
        }
    }
}

enum TextColorPick: Identifiable, CaseIterable {
    case black, white

    var id: String {
        self.description
    }

    var color: Color {
        switch self {
        case .black: return .black
        case .white: return .white
        }
    }

    var description: String {
        switch self {
        case .black: return "Black"
        case .white: return "White"
        }
    }
}
