//
//  log.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

// enum for tabs
enum Tab {
    case home, cloud, log, music, breathe
}

// main view
struct AppView: View {
    @State private var selectedTab: Tab = .log
    
    var body: some View {
        ZStack {
            Color(red: 0.133, green: 0.133, blue: 0.231)
                .ignoresSafeArea()
            
            VStack {
                // show for selected page
                switch selectedTab {
                    case .home: ContentView()
                    case .cloud: cloud()
                    case .log: log()
                    case .music: music()
                    case .breathe: breathe()
                }
                Spacer()
                // bar with icons
                HStack {
                    TabButton(tab: .home, icon: "house", selectedTab: $selectedTab)
                    TabButton(tab: .cloud, icon: "cloud", selectedTab: $selectedTab)
                    TabButton(tab: .log, icon: "plus.circle", selectedTab: $selectedTab)
                    TabButton(tab: .music, icon: "music.note.list", selectedTab: $selectedTab)
                    TabButton(tab: .breathe, icon: "wind", selectedTab: $selectedTab)
                }
            }
        }
    }
}

// tab button view
struct TabButton: View {
    let tab: Tab
    let icon: String
    @Binding var selectedTab: Tab
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(selectedTab == tab ? Color(red: 0.851, green: 0.765, blue: 0.416) : Color(red: 0.765, green: 0.780, blue: 0.867))
                .padding()
        }
    }
}

// log view
struct log: View {
    var body: some View {
        Text("log")
    }
}

#Preview {
    AppView()
}
