//
//  TabButton.swift
//  cloudrestApp
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

struct TabButton: View {
    let tab: Tab
    let icon: String
    @EnvironmentObject var tabController: TabController
    
    var body: some View {
        Button {
            tabController.selectedTab = tab
        } label: {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(
                    tabController.selectedTab == tab
                    ? Color(red: 0.851, green: 0.765, blue: 0.416)
                    : Color(red: 0.765, green: 0.780, blue: 0.867)
                )
                .padding()
        }
    }
}
