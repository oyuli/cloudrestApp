//
//  music.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI
import WebKit

struct music: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Sleep Music")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top)

            Text("Wind down with calming sounds. Press play and let your mind drift.")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            SpotifyWebView(urlString: "https://open.spotify.com/embed/playlist/37i9dQZF1DX4sWSpwq3LiO") // Sleep playlist

            Spacer()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct SpotifyWebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        webView.scrollView.isScrollEnabled = false // disable scrolling inside the player
        webView.layer.cornerRadius = 12
        webView.clipsToBounds = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
    music()
}
