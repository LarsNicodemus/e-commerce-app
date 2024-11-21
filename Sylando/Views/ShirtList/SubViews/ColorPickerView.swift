//
//  ColorPicker.swift
//  Sylando
//
//  Created by Lars Nicodemus on 21.11.24.
//

import SwiftUI

struct ColorPickerView: View {
    @ObservedObject var shirtVm: ShirtsViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Farbe")
                    .padding(.bottom, 16)
                    .foregroundColor(Color(UIColor.systemGray3))
                Spacer()
                HStack {
                    ForEach(TextColorPick.allCases, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(color.color)
                            .stroke(
                                color.color == .white
                                    ? Color.primary : Color.clear, lineWidth: 1
                            )
                            .frame(width: 25, height: 25)
                            .overlay(
                                shirtVm.textColorPicker == color
                                    ? RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.primary, lineWidth: 3)
                                    : nil
                            )

                            .onTapGesture {
                                shirtVm.textColorPicker = color
                            }
                    }
                }
            }
            HStack {
                ForEach(ColorPick.allCases, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color.color)
                        .stroke(
                            color.color == .white ? Color.primary : Color.clear,
                            lineWidth: 1
                        )
                        .frame(width: 25, height: 25)
                        .overlay(
                            shirtVm.colorPicker == color
                                ? RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.primary, lineWidth: 3) : nil
                        )
                        .onTapGesture {
                            shirtVm.colorPicker = color
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ColorPickerView(shirtVm: ShirtsViewModel())
}
