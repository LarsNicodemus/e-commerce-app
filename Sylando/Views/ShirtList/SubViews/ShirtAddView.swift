//
//  ShirtAddView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 19.11.24.
//

import SwiftUI

struct ShirtAddView: View {
    @ObservedObject var shirtVm: ShirtsViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Button("Change Design") {

                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                        Spacer()
                    }
                }

                Section {
                    TextField("Titel", text: $shirtVm.shirtTitle)
                        .padding()
                }
                Section {
                    VStack(alignment: .leading) {
                        Text("Größe")
                            .padding(.bottom, 16)
                            .foregroundColor(Color(UIColor.systemGray3))
                        Picker("Größe", selection: $shirtVm.selectedSize) {
                            ForEach(Size.allCases, id: \.self) { sizes in
                                Text(sizes.title)
                            }
                        }
                        .pickerStyle(.palette)
                    }
                    .padding()
                }
                Section {
                    
                    TextField("Preis", text: $shirtVm.shirtPrice)
                        .keyboardType(.numberPad)
                        .padding()
                }
                Section {
                    HStack {
                        Spacer()
                        Button("Save Shirt") {
                            addShirt()
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                        Spacer()
                    }
                }
            }
            .listSectionSpacing(8)
        }
        .navigationTitle("Neues T-Shirt")
    }
    func addShirt() {
        if !shirtVm.shirtPrice.isEmpty && !shirtVm.shirtTitle.isEmpty {
            let convertPrice = shirtVm.shirtPrice.replacingOccurrences(of: ",", with: ".")
            guard let price = Double(convertPrice) else { return }
            let newShirt = Shirt(title: shirtVm.shirtTitle, price: price, size: shirtVm.selectedSize.rawValue)
            shirtVm.addShirt(shirt: newShirt)
            shirtVm.shirtTitle = ""
            shirtVm.shirtPrice = ""
            shirtVm.selectedSize = .m
            shirtVm.isPresented = false
        }
    }
}

#Preview {
    ShirtAddView(shirtVm: ShirtsViewModel())
}
