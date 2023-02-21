//
//  WeightView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 19/02/2023.
//

import SwiftUI

struct WeightView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: WeightViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("kg")
                TextField("", text: $viewModel.weight)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .disableAutocorrection(true)
                    .focused($isFocused)
            }
            Button(action: {
                Task {
                    await viewModel.loadFromHealth()
                    viewModel.update()
                    dismiss()
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
            viewModel.onAppear()
        }
        .toolbar {
            Button(action: {
                viewModel.save()
                viewModel.update()
                dismiss()
            }, label: {
                Text("Save")
            })
        }
    }
}

struct WeightViewView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
            .environmentObject(WeightViewModel())
    }
}
