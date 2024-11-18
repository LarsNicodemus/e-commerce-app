//
//  ShirtListView.swift
//  Sylando
//
//  Created by Lars Nicodemus on 18.11.24.
//

import SwiftUI

struct ShirtListView: View {
    @StateObject private var vm = ShirtsViewModel()
    var body: some View {
        NavigationStack {
                    List(vm.shirts) { shirt in
                        Text(shirt.title)
                    }
                    .navigationTitle("Shirts")
                }
    }
}
#Preview {
    ShirtListView()
}
