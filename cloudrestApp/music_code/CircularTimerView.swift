//
//  CircularTimerView.swift
//  cloudrestApp
//
//  Created by Scholar on 7/17/25.
//

import SwiftUI

struct CircularTimerView: View {
    var progress: Double // 0.0 to 1.0
    var timeRemaining: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("BrighterYellow"))
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color("BrighterYellow"), style: StrokeStyle(lineWidth: 7, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 0.2), value: progress)
            Text(timeRemaining)
                .font(.lexend(fontStyle: .title, fontWeight: .bold))
                .foregroundColor(Color("BrighterYellow"))
        }
        .frame(width: 150, height: 150)
    }
}
