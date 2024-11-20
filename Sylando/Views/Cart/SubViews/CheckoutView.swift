//
//  Checkout2.swift
//  Sylando
//
//  Created by Lars Nicodemus on 19.11.24.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject
    private var cartVm: CartViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Bitte gib deine Daten ein:")
                    .padding(.top, 64)
                TextField("Name", text: $cartVm.name)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                TextField("Street", text: $cartVm.street)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                TextField("City", text: $cartVm.city)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                if cartVm.showError {
                    Text("Bitte fülle alle Felder aus.")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
            Button("Weiter") {
                if !cartVm.name.isEmpty && !cartVm.street.isEmpty && !cartVm.city.isEmpty {
                    cartVm.buttonPressed = true
                    cartVm.showError = false
                } else {
                    cartVm.showError = true
                }
                
            }
            .padding(.bottom, 64)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(CartViewModel())
}
