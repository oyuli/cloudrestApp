//
//  music.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI
import WebKit

struct music: View {
    @State private var selectedURL = "https://open.spotify.com/embed/playlist/37i9dQZF1DWUzFXarNiofw" // Default: white noise

    let musicOptions: [(title: String, url: String)] = [
        ("White Noise", "https://open.spotify.com/embed/playlist/37i9dQZF1DWUzFXarNiofw"),
        ("Brown Noise", "https://open.spotify.com/embed/playlist/1iXBZBBzBzOz8dSYzPzyCb"),
        ("Pink Noise", "https://open.spotify.com/embed/playlist/37i9dQZF1DWX83CujKHHOn"),
        ("Rain & Thunder", "https://open.spotify.com/embed/playlist/37i9dQZF1DWZtZ8vUCzche"),
        ("Ocean Sounds", "https://open.spotify.com/embed/playlist/37i9dQZF1DWXe9gFZP0gtP"),
        ("Lo-fi Sleep", "https://open.spotify.com/embed/playlist/37i9dQZF1DX4sWSpwq3LiO")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Sleep Music")
                //.font(.largeTitle)
                //.fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top)
                .font(.lexend(fontStyle: .title, fontWeight: .semibold))

            Text("Wind down with calming sounds. Choose a vibe and press play.")
                //.font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .font(.lexend(fontStyle: .body, fontWeight: .semibold))

            // Buttons to select music types
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(musicOptions, id: \.url) { option in
                        Button(action: {
                            selectedURL = option.url
                        }) {
                            Text(option.title)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.white.opacity(0.15))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.lexend(fontStyle: .body, fontWeight: .regular))
                        }
                    }
                }
                .padding(.bottom, 10)
            }

            SpotifyWebView(urlString: selectedURL)
                .frame(height: 80)

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
        loadURL(webView)
        webView.scrollView.isScrollEnabled = false
        webView.layer.cornerRadius = 12
        webView.clipsToBounds = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        loadURL(uiView)
    }

    private func loadURL(_ webView: WKWebView) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

#Preview {
    music()
}
