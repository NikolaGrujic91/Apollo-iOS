//
//  WeightView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 19/02/2023.
//

import SwiftUI

struct WeightView: View {
    @State private var viewModel = WeightViewModel()
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("kg")
                TextField("", value: $viewModel.weight, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    .disableAutocorrection(true)
                    .focused($isFocused)
                    .onChange(of: viewModel.weight) { newValue in
                        viewModel.weight = newValue
                    }
            }
            Button(action: viewModel.save) {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            Button(action: {
                Task {
                    await viewModel.loadFromHealth()
                }
            }, label: {
                Text("Load from Health")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.bordered)
        }
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}

struct WeightViewView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
