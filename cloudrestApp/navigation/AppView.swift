//
//  AppView.swift
//  cloudrestApp
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

struct AppView: View {
    @StateObject private var tabController = TabController()
    @StateObject private var sleepData = SleepDataStore()
    
    var body: some View {
        ZStack {
            Color(red: 0.133, green: 0.133, blue: 0.231)
                .ignoresSafeArea()
            VStack {
                switch tabController.selectedTab {
                case .home: ContentView(store: sleepData)
                    case .cloud: cloud()
                    case .log: log()
                    case .music: music()
                    case .breathe: breathe()
                    case .about: about()
                }
                Spacer()
                
                HStack {
                    TabButton(tab: .home, icon: "house")
                    TabButton(tab: .cloud, icon: "cloud")
                    TabButton(tab: .log, icon: "plus.circle")
                    TabButton(tab: .music, icon: "music.note.list")
                    TabButton(tab: .breathe, icon: "wind")
                    TabButton(tab: .about, icon: "star")
                }
                
            }
        }
        .environmentObject(tabController)
        .environmentObject(sleepData)
    }
}

#Preview {
    AppView()
}
