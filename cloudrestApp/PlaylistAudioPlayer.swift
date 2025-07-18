//
//  PlaylistAudioPlayer.swift
//  cloudrestApp
//
//  Created by Scholar on 7/17/25.
//

import Foundation
import AVFoundation

class PlaylistAudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    private var player: AVAudioPlayer?
    private var playlist: [String] = []
    private var currentIndex = 0
    private var sleepTimer: Timer?
    private var countdownTimer: Timer?
    private var timeRemainingInSeconds: Int = 0
    
    @Published var isPlaying = false
    @Published var isPaused = false
    @Published var currentTrackName: String = ""
    @Published var currentTrackNumber: Int = 0
    @Published var totalTracks: Int = 0
    @Published var timeRemainingDisplay: String = ""
    
    func loadPlaylist(for category: String) {
        let allFiles = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        playlist = allFiles
            .map { URL(fileURLWithPath: $0).lastPathComponent }
            .filter { $0.hasPrefix(category + "_") }
            .sorted()
        
        currentIndex = 0
        totalTracks = playlist.count
        playCurrentTrack()
    }
    func playCurrentTrack() {
        guard playlist.indices.contains(currentIndex) else {
            stop()
            return
        }
        let fileName = playlist[currentIndex].replacingOccurrences(of: ".mp3", with: "")
        currentTrackName = fileName
        currentTrackNumber = currentIndex + 1
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.delegate = self
                player?.play()
                isPlaying = true
                isPaused = false
            } catch {
                print("error playing: \(error)")
            }
        }
    }
    
    func pauseOrResume() {
        guard let player = player else { return }
        
        if isPaused {
            player.play()
        } else {
            player.pause()
        }
        
        isPaused.toggle()
    }
    
    func stop() {
        player?.stop()
        isPlaying = false
        isPaused = false
        currentTrackName = ""
        currentTrackNumber = 0
        totalTracks = 0
        cancelSleepTimer()
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        currentIndex += 1
        playCurrentTrack()
    }
    
    func startSleepTimer(minutes: Int) {
        cancelSleepTimer()
        timeRemainingInSeconds = minutes * 60
        updateTimeRemainingDisplay()
        sleepTimer = Timer.scheduledTimer(withTimeInterval: Double(minutes * 60), repeats: false) { _ in
            self.stop()
        }
        
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.timeRemainingInSeconds -= 1
            self.updateTimeRemainingDisplay()
            
            if self.timeRemainingInSeconds <= 0 {
                self.countdownTimer?.invalidate()
            }
        }
    }
    
    func updateTimeRemainingDisplay() {
        let minutes = timeRemainingInSeconds / 60
        let seconds = timeRemainingInSeconds % 60
        DispatchQueue.main.async {
            self.timeRemainingDisplay = String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    func cancelSleepTimer() {
        sleepTimer?.invalidate()
        countdownTimer?.invalidate()
        sleepTimer = nil
        countdownTimer = nil
        timeRemainingDisplay = ""
    }
}









