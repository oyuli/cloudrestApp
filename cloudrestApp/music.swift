//
//  music.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI
import WebKit

struct music: View {
    @State private var selectedURL = "https://open.spotify.com/embed/playlist/37i9dQZF1DWUzFXarNiofw" // Default: White Noise

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
            // Title
            Text("Sleep Music")
                .font(.system(size: 34, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .padding(.top)

            // Subtitle
            Text("Wind down with calming sounds.\nChoose a vibe and press play.")
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Music Option Buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(musicOptions, id: \.url) { option in
                        Button(action: {
                            selectedURL = option.url
                        }) {
                            Text(option.title)
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color.white.opacity(0.15))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.bottom, 10)
            }

            // Spotify WebView
            SpotifyWebView(urlString: selectedURL)
                .frame(height: 80)

            Spacer()
        }
        .padding()
        .background(Color(red: 10/255, green: 25/255, blue: 47/255)) // Dark blue background
        .edgesIgnoringSafeArea(.all)
    }
}

struct SpotifyWebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.layer.cornerRadius = 12
        webView.clipsToBounds = true
        loadURL(in: webView)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        loadURL(in: uiView)
    }

    private func loadURL(in webView: WKWebView) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

#Preview {
    AppView()
}
