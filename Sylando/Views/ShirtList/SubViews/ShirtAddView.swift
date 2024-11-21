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
                    VStack {
                        if let quote = shirtVm.quote {
                            ZStack {
                                Image(systemName: "tshirt.fill")
                                    .font(.system(size: 200))
                                    .fontWeight(.ultraLight)
                                    .foregroundStyle(shirtVm.colorPicker.color)
                                    .overlay(
                                        Image(systemName: "tshirt")
                                            .font(.system(size: 200))
                                            .fontWeight(.ultraLight)
                                            .foregroundStyle(.black)
                                    )
                                Text(quote.text)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .frame(width: 110)
                                    .foregroundStyle(shirtVm.textColorPicker.color)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)
                        }

                        HStack {
                            Spacer()
                            Button("Change Design") {
                                shirtVm.fetchQuote()
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                            Spacer()
                        }

                    }
                }
                Section {
                    ColorPickerView(shirtVm: shirtVm)
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
        .onAppear {
            shirtVm.fetchQuote()
        }
        .navigationTitle("Neues T-Shirt")
    }

    func addShirt() {
        if !shirtVm.shirtPrice.isEmpty && !shirtVm.shirtTitle.isEmpty {
            let convertPrice = shirtVm.shirtPrice.replacingOccurrences(
                of: ",", with: ".")
            guard let price = Double(convertPrice) else { return }
            guard let quote = shirtVm.quote else { return }
            let newShirt = Shirt(
                title: shirtVm.shirtTitle, price: price,
                size: shirtVm.selectedSize.title,
                color: shirtVm.colorPicker.color, quoteText: quote.text, quoteTextColor: shirtVm.textColorPicker.color)
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
