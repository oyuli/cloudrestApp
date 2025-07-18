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
        ("ambient", "https://open.spotify.com/playlist/37i9dQZF1DWUZ5bk6qqDSy?si=d566fa6eac134b3e"),
        ("white noise", "https://open.spotify.com/playlist/37i9dQZF1DX4hpot8sYudB?si=53301693e39f4390"),
        ("brown noise", "https://open.spotify.com/playlist/37i9dQZF1DWZhzMp90Opmn?si=e7f9738d0d124aea"),
        ("nature", "https://open.spotify.com/playlist/37i9dQZF1DWUKPeBypcpcP?si=b750852c767245f7"),
        ("ocean", "https://open.spotify.com/playlist/6KqTyKdhaJeC46k3t8hSZw?si=357169f5c7a24150"),
        ("lo-fi", "https://open.spotify.com/playlist/37i9dQZF1DX2PQDq3PdrHQ?si=571e795a488345d4")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("sleep music")
                //.font(.system(size: 34, weight: .heavy, design: .rounded))
                .padding(.top, 60.0)
                .font(.lexend(fontStyle: .title, fontWeight: .bold))
                .foregroundColor(Color("Icons"))
                .kerning(0.75)

            // Subtitle
            Text("wind down with calming sounds")
                //.font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(Color("BrighterYellow"))
                //.font(.title3)
                //.fontWeight(.bold)
                .kerning(0.5)
                .font(.lexend(fontStyle: .title3, fontWeight: .bold))

            // Music Option Buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(musicOptions, id: \.url) { option in
                        Button(action: {
                            selectedURL = option.url
                        }) {
                            Text(option.title)
                                //.font(.system(size: 15, weight: .semibold, design: .rounded))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color("Buttons").opacity(0.3))
                                .foregroundColor(Color("Icons"))
                                .cornerRadius(12)
                                .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                        }
                    }
                }
                .padding(.bottom, 10)
            }

            // Spotify WebView
            SpotifyWebView(urlString: selectedURL)
                .frame(width: 375, height: 430)
            Spacer()
        }
        .padding()
        .background(Color("Background")) // Dark blue background
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
