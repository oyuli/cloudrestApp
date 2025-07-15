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
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    // go to home
                    NavigationLink {
                        ContentView()
                    } label: {
                        Image(systemName: "house")
                    }
                    // go to cloud
                    NavigationLink(destination: cloud()) {
                        Text("cloud")
                    }
                    NavigationLink(destination: log()) {
                        Text("log")
                    }
                    NavigationLink(destination: music()) {
                        Text("music")
                    }
                    NavigationLink(destination: breathe()) {
                        Text("breathe")
                    }
                }
            }
        }
    }
    //end struct
}

#Preview {
    log()
}
