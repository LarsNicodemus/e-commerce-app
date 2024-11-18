//
//  CheckOutView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct CheckOutView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = CartViewModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16){
                Text("Bitte gib deine Daten ein:")
                    .padding(.top,64)
                TextField(vm.name.isEmpty ? "Name" : vm.name, text: $vm.name)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                TextField(vm.street.isEmpty ? "Street" : vm.street, text: $vm.street)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                TextField(vm.city.isEmpty ? "City" : vm.city, text: $vm.city)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
            }
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Buy")
            }.buttonStyle(.borderedProminent)
                .padding(.bottom,64)
        }
    }
}

#Preview {
    CheckOutView()
}
