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
  let categories = ["ambient", "ocean", "nature", "lo-fi"]
  let categoryNames = [
    "ambient": "ambient", "ocean": "ocean", "nature": "nature", "lo-fi": "lo-fi"
  ]
  let timerOptions = [15, 30, 60, 360, 480] // in minutes
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      // Top Title Section
      VStack(alignment: .leading, spacing: 20) {
        Text("sleep music")
          .font(.lexend(fontStyle: .title, fontWeight: .bold))
          .foregroundColor(Color("Icons"))
          .padding(.top)
        Text("wind down with calming sounds")
          .font(.lexend(fontStyle: .title3, fontWeight: .bold))
          .foregroundColor(Color("BrighterYellow"))
      }
      .padding(.top, 60)
      // Categories
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
        .padding(.bottom, 4)
      }
      if audioPlayer.isPlaying {
        // Track Info Card
        VStack(spacing: 12) {
          Text(audioPlayer.currentTrackName)
            .font(.lexend(fontStyle: .headline, fontWeight: .bold))
            .kerning(0.5)
            .foregroundColor(Color("Icons"))
            .lineLimit(1)
            .truncationMode(.middle)
            .padding(.horizontal, 8)
          Text("track \(audioPlayer.currentTrackNumber) of \(audioPlayer.totalTracks)")
            .font(.lexend(fontStyle: .subheadline, fontWeight: .regular))
            .foregroundColor(Color("Icons").opacity(0.8))
          HStack(spacing: 30) {
            Button(action: {
              audioPlayer.pauseOrResume()
            }) {
              Image(systemName: audioPlayer.isPaused ? "play.circle.fill" : "pause.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("Buttons"))
            }
            Button(action: {
              audioPlayer.stop()
            }) {
              Image(systemName: "stop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("BrighterYellow"))
            }
          }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("Buttons").opacity(0.2))
        .cornerRadius(20)
      }
      // Sleep Timer Section
      VStack(alignment: .leading, spacing: 20) {
        Text("sleep timer")
          .font(.lexend(fontStyle: .title3, fontWeight: .bold))
          .foregroundColor(Color("BrighterYellow"))
          .padding(.top, 1)
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
          VStack(spacing: 12) {
            CircularTimerView(
              progress: audioPlayer.timerProgress,
              timeRemaining: audioPlayer.timeRemainingDisplay
            )
            .frame(maxWidth: .infinity)
            .padding(.top, 24)
            Button("cancel timer") {
              audioPlayer.cancelSleepTimer()
            }
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
            .kerning(0.5)
            .foregroundColor(Color("BrighterYellow"))
            .frame(maxWidth: .infinity, alignment: .center)
          }
        }
      }
    }
    .padding(.horizontal)
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
















