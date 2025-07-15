//
//  log.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct log: View {
    var body: some View {
            NavigationStack {
                VStack {
                    Text("log")
                }
                // navigation toolbar
                .toolbar {
                    ToolbarItemGroup(placement: .status) {
                        // go to home
                        NavigationLink {
                            ContentView()
                        } label: {
                            Image(systemName: "house")
                        }
                        .buttonStyle(IconNavigationLinkStyle())
                        // go to cloud
                        NavigationLink {
                            cloud()
                        } label: {
                            Image(systemName: "cloud")
                        }
                        // go to log
                        NavigationLink {
                            log()
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                        // go to music
                        NavigationLink {
                            music()
                        } label: {
                            Image(systemName: "music.note.list")
                        }
                        // go to breathe
                        NavigationLink {
                            breathe()
                        } label: {
                            Image(systemName: "wind")
                        }
                    }
                }
            }
    }
}

struct IconNavigationLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .accentColor : Color(red: 195, green: 199, blue: 221))
            .contentShape(Rectangle())
    }
}

#Preview {
    log()
}
