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
                .font(.lexend(fontStyle: .title2, fontWeight: .semibold))
            
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .foregroundColor(Color("BrighterYellow"))
                .padding(.bottom)
                .font(.lexend(fontStyle: .title3, fontWeight: .bold))
            
            Button("log sleep") {
                showInputSheet = true
            }
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
            .foregroundColor(Color("Buttons"))
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

// .kerning(0.75)
// .font(.lexend(fontStyle: .title3, fontWeight: .semibold))
