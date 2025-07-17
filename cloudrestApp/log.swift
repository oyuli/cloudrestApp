//
//  log.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct log: View {
    @EnvironmentObject var tabController: TabController
    @EnvironmentObject var sleepData: SleepDataStore
    
    @State var selectedDate = Date()
    @State private var showInputSheet = false
    
    var body: some View {
        VStack {
            CustomDatePicker(selectedDate: $selectedDate)
                .padding()
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(Color(red: 0.851, green: 0.765, blue: 0.416))
                .padding(.bottom)
            
            Button("log sleep") {
                showInputSheet = true
            }
            .sheet(isPresented: $showInputSheet) {
                SleepInputSheet(date: selectedDate)
                    .environmentObject(sleepData)
            }
        }
    }
}

#Preview {
    AppView()
}
