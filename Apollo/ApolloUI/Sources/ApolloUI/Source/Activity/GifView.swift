//
//  GifView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 06/03/2023.
//

import SwiftUI
import ApolloImages
import FLAnimatedImage

struct GifView: UIViewRepresentable {
    @EnvironmentObject private var viewModel: PlansViewModel
    let animatedImageView = FLAnimatedImageView()
    var gif: Gifs

    // MARK: - UIViewRepresentable
    func makeUIView(context: UIViewRepresentableContext<GifView>) -> UIView {
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

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifView>) {}
}

struct GifView_Previews: PreviewProvider {
    static var previews: some View {
        GifView(gif: .success)
            .frame(width: 200, height: 200)
            .environmentObject(PlansViewModel())
    }
}