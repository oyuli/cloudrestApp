//
//  music.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct music: View {
    @StateObject private var audioPlayer = PlaylistAudioPlayer()
    
    let categories = ["ambient", "white", "brown", "ocean", "nature", "lo-fi"]
    let categoryNames = [
        "ambient": "ambient",
        "white": "white noise",
        "brown": "brown noise",
        "ocean": "ocean",
        "nature": "nature",
        "lo-fi": "lo-fi"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("sleep music")
                .font(.lexend(fontStyle: .title, fontWeight: .bold))
                .foregroundColor(Color("Icons"))
                .padding(.top, 60)
            Text("wind down with calming sounds")
                .font(.lexend(fontStyle: .title3, fontWeight: .bold))
                .foregroundColor(Color("BrighterYellow"))
            
            // categories
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.self) { cat in
                        Button(action: {
                            audioPlayer.loadPlaylist(for: cat)
                        }) {
                            Text(categoryNames[cat] ?? cat.capitalized)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color("Buttons").opacity(0.3))
                                .foregroundColor(Color("Icons"))
                                .cornerRadius(12)
                                .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                        }
                    }
                }
            }
            if audioPlayer.isPlaying {
                VStack(alignment: .leading, spacing: 10) {
                    Text("now playing:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(audioPlayer.currentTrackName)
                        .font(.body)
                        .foregroundColor(Color("Icons"))
                    
                    Text("track \(audioPlayer.currentTrackNumber) of \(audioPlayer.totalTracks)")
                    
                    HStack(spacing: 20) {
                        Button(audioPlayer.isPaused ? "resume" : "pause") {
                            audioPlayer.pauseOrResume()
                        }
                        .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                        .foregroundColor(Color("Buttons"))
                        
                        Button("stop") {
                            audioPlayer.stop()
                        }
                        .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                        .foregroundColor(Color("BrighterYellow"))
                    }
                }
            }
            
            if audioPlayer.isPlaying {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("sleep timer")
                                    .font(.headline)
                                    .foregroundColor(Color("Icons"))
                                HStack {
                                    ForEach([15, 30, 60], id: \.self) { min in
                                        Button("\(min) min") {
                                            audioPlayer.startSleepTimer(minutes: min)
                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(Color("Buttons").opacity(0.3))
                                        .foregroundColor(Color("Icons"))
                                        .cornerRadius(10)
                                        .font(.lexend(fontStyle: .caption, fontWeight: .medium))
                                    }
                                }
                                Button("cancel timer") {
                                    audioPlayer.cancelSleepTimer()
                                }
                                .foregroundColor(.orange)
                                .font(.caption)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color("Background"))
                    .edgesIgnoringSafeArea(.all)
                }
            }

#Preview {
    AppView()
}
