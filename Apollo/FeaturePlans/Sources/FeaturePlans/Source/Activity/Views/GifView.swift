//
//  GifView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 06/03/2023.
//

import FLAnimatedImage
import FoundationImages
import SwiftUI

@MainActor
struct GifView: UIViewRepresentable {
    // MARK: - Properties

    @Environment(PlansViewModel.self)
    private var viewModel

    let animatedImageView = FLAnimatedImageView()
    var gif: Gifs

    // MARK: - UIViewRepresentable

    func makeUIView(context _: UIViewRepresentableContext<GifView>) -> UIView {
        animatedImageView.animatedImage = FLAnimatedImage(animatedGIFData: viewModel.getGif(gif))
        animatedImageView.translatesAutoresizingMaskIntoConstraints = false

        let view = UIView()
        view.addSubview(animatedImageView)

        NSLayoutConstraint.activate([
            animatedImageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedImageView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_: UIView, context _: UIViewRepresentableContext<GifView>) {}
}

// MARK: - Preview

#Preview {
    GifView(gif: .success)
        .frame(width: 200, height: 200)
        .environment(PlansViewModel())
}
