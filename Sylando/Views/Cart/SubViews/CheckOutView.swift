//
//  CheckOutView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct CheckOutView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject
    private var cartVm: CartViewModel
    @State private var showError = false
    @Binding var path: NavigationPath
    var body: some View {
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

            if showError {
                Text("Bitte fülle alle Felder aus.")
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Spacer()
                .navigationTitle("CheckOut")
            
        }
        .padding()
        Button("Weiter") {
            path.append("Summary")
            print(path.count)
            print(path)
        }
        .buttonStyle(.borderedProminent)
        .navigationDestination(for: String.self) { destination in
            if destination == "Summary" {
                SummaryView(path: $path)
            }
        }
    }
}

#Preview {
    CheckOutView(path: .constant(NavigationPath()))
        .environmentObject(CartViewModel())
}
