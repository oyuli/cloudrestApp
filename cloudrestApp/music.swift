//
//  music.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI
import AVFoundation

struct music: View {
    @StateObject private var audioPlayer = PlaylistAudioPlayer()
    let categories = ["ambient", "white", "ocean", "nature", "lo-fi"]
    let categoryNames = [
        "ambient": "ambient", "white": "white noise", "ocean": "ocean", "nature": "nature", "lo-fi": "lo-fi"
    ]
    let timerOptions = [15, 30, 60, 360, 480] // in minutes
    
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
                        Button {
                            audioPlayer.loadPlaylist(for: cat)
                        } label: {
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
                VStack(alignment: .leading, spacing: 20) {
                    Text("now playing:")
                        .font(.lexend(fontStyle: .title3, fontWeight: .bold))
                        .kerning(0.5)
                        .foregroundColor(Color("Buttons"))
                    Text(audioPlayer.currentTrackName)
                        .foregroundColor(Color("Icons"))
                    Text("track \(audioPlayer.currentTrackNumber) of \(audioPlayer.totalTracks)")
                        .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                        .kerning(0.5)
                        .foregroundColor(Color("Buttons"))
                    // Playback controls
                    HStack(spacing: 25) {
                        Button(action: {
                            audioPlayer.pauseOrResume()
                        }) {
                            Image(systemName: audioPlayer.isPaused ? "play.fill" : "pause.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("Buttons"))
                        }
                        Button(action: {
                            audioPlayer.stop()
                        }) {
                            Image(systemName: "stop.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("BrighterYellow"))
                        }
                    }
                }
                // sleep timer
                VStack(alignment: .leading, spacing: 20) {
                    Text("sleep timer")
                        .font(.lexend(fontStyle: .title3, fontWeight: .bold))
                        .foregroundColor(Color("BrighterYellow"))
                    HStack {
                        ForEach(timerOptions, id: \.self) { minutes in
                            Button(action: {
                                audioPlayer.startSleepTimer(minutes: minutes)
                            }) {
                                Text(timeLabel(for: minutes))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(Color("Buttons").opacity(0.3))
                                    .foregroundColor(Color("Icons"))
                                    .cornerRadius(12)
                                    .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                            }
                        }
                    }
                    if !audioPlayer.timeRemainingDisplay.isEmpty {
                        CircularTimerView (
                            progress: audioPlayer.timerProgress,
                            timeRemaining: audioPlayer.timeRemainingDisplay
                        )
                        Button("cancel timer") {
                            audioPlayer.cancelSleepTimer()
                        }
                        .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                        .kerning(0.5)
                        .foregroundColor(Color("BrighterYellow"))
                    }
                }
            }
            Spacer()
        }
        .padding()
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
    }
    private func timeLabel(for minutes: Int) -> String {
        switch minutes {
        case 60: return "1h"
        case 360: return "6h"
        case 480: return "8h"
        default: return "\(minutes)m"
        }
    }
}


#Preview {
    AppView()
}
