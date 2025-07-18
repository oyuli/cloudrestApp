//
//  SleepInputSheet.swift
//  cloudrestApp
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI
import Foundation
struct SleepInputSheet: View {
  @EnvironmentObject var sleepData: SleepDataStore
  @Environment(\.dismiss) var dismiss
  let date: Date
  @State private var sleepStart = Date()
  @State private var sleepEnd = Date()
  @State private var sleepQuality = 3
  @State private var guidedBreathing = false
  @State private var exercised = false
  @State private var listenedToMusic = false
  @State private var ateBeforeBed = false
  @State private var scrolledDevices = false
  @State private var drankCaffeine = false
  var body: some View {
    NavigationStack {
      ZStack {
        Color("Background")
          .ignoresSafeArea()
        ScrollView {
          VStack(spacing: 20) {
            Text(date.formatted(date: .abbreviated, time: .omitted))
              .font(.lexend(fontStyle: .title, fontWeight: .bold))
              .foregroundColor(Color("Icons"))
              .kerning(0.75)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.horizontal)
            VStack(alignment: .leading, spacing: 12) {
              Text("my sleep")
                .foregroundColor(Color("Background"))
                .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                .kerning(0.5)
              DatePicker("went to bed", selection: $sleepStart, displayedComponents: .hourAndMinute)
              DatePicker("woke up", selection: $sleepEnd, displayedComponents: .hourAndMinute)
              Stepper("sleep quality: \(sleepQuality) / 5", value: $sleepQuality, in: 1...5)
            }
            .padding()
            .background(Color("Icons"))
            .cornerRadius(16)
            .foregroundColor(Color("SmallBackground"))
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
            .kerning(0.5)
            .tint(Color("SmallBackground"))
            VStack(alignment: .leading, spacing: 12) {
              Text("did you...?")
                .foregroundColor(Color("Background"))
                .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                .kerning(0.5)
              Toggle("guided breathing", isOn: $guidedBreathing)
              Toggle("exercise", isOn: $exercised)
              Toggle("listen to music", isOn: $listenedToMusic)
              Toggle("eat before bed", isOn: $ateBeforeBed)
              Toggle("scroll on devices", isOn: $scrolledDevices)
              Toggle("drank caffeine", isOn: $drankCaffeine)
            }
            .padding()
            .background(Color("Icons"))
            .cornerRadius(16)
            .foregroundColor(Color("SmallBackground"))
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
            .kerning(0.5)
            .tint(Color("SmallBackground"))
          }
          .padding()
        }
      }
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("submit") {
            let entry = SleepEntry(
              date: date,
              sleepStart: sleepStart,
              sleepEnd: sleepEnd,
              sleepQuality: sleepQuality,
              activities: Activities(
                guidedBreathing: guidedBreathing,
                exercised: exercised,
                listenedToMusic: listenedToMusic,
                ateBeforeBed: ateBeforeBed,
                scrolledDevices: scrolledDevices,
                drankCaffeine: drankCaffeine
              )
            )
            sleepData.addEntry(entry)
            dismiss()
          }
          .font(.lexend(fontStyle: .title3, fontWeight: .bold))
          .foregroundColor(Color("BrighterYellow"))
        }
        ToolbarItem(placement: .cancellationAction) {
          Button("cancel") {
            dismiss()
          }
          .font(.lexend(fontStyle: .title3, fontWeight: .bold))
          .foregroundColor(Color("BrighterYellow"))
        }
      }
    }
  }
}
#Preview {
  SleepInputSheet(date: Date())
    .environmentObject(SleepDataStore())
}










