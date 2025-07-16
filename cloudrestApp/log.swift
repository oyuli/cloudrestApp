//
//  log.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct log: View {
    @EnvironmentObject var tabController: TabController
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            DatePicker(selectedDate: $selectedDate)
                .padding()
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(Color(red: 0.851, green: 0.765, blue: 0.416))
        }
    }
}

#Preview {
    AppView()
}
