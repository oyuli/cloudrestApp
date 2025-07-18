//
//  ContentView.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SleepDataStore
    
    var body: some View {
        let today = Date()
        let summary = store.summarizeSleep(forMonth: today)
        
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0) {
                Text(Date(), style: .date)
                    //.font(.title)
                    //.fontWeight(.bold)
                    .foregroundColor(Color("Icons"))
                    .kerning(0.75)
                    .font(.lexend(fontStyle: .title, fontWeight: .bold))
    
                Text("here is a recap of your month so far")
                    .foregroundColor(Color("BrighterYellow"))
                    //.font(.title3)
                    //.fontWeight(.bold)
                    .kerning(0)
                    .font(.lexend(fontStyle: .title3, fontWeight: .bold))
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                            .foregroundColor(Color("SmallBackground"))
                        Text(summary != nil ? String(format: "%.1f h", summary!.averageDuration / 3600) : "—")
                            //.fontWeight(.semibold)
                            .foregroundColor(Color("BrighterYellow"))
                            .font(.lexend(fontStyle: .title2, fontWeight: .bold))
                            .kerning(0.5)
                    }
                    Text("your average daily rest")
                        //.font(.headline)
                        //.fontWeight(.heavy)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                        .kerning(0.5)
                        .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                }
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                            .foregroundColor(Color("SmallBackground"))
                        Text(summary != nil ? String(format: "%.1f h", summary!.maxDuration / 3600) : "—")
                            //.fontWeight(.bold)
                            .foregroundColor(Color("BrighterYellow"))
                            .font(.lexend(fontStyle: .title2, fontWeight: .bold))
                            .kerning(0.5)
                    }
                    Text("your longest rest so far")
                        //.font(.headline)
                        //.fontWeight(.heavy)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                        .kerning(0.5)
                        .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                }
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                            .foregroundColor(Color("SmallBackground"))
                        Image(systemName: summary != nil && summary!.averageQuality >= 4 ? "hand.thumbsup.fill" : "hand.thumbsdown.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("BrighterYellow"))
                    }
                    Text("your average sleep quality")
                        //.font(.headline)
                        //.fontWeight(.bold)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                        .kerning(0.5)
                        .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                }
                HStack {
                    VStack(alignment: .center, spacing: 10.0) {
                        Text("activities that improved your sleep")
                            .foregroundColor(Color("BrighterYellow"))
                            //.font(.title3)
                            //.fontWeight(.bold)
                            .padding(.top, 1)
                            .kerning(0.5)
                            .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                        
                        let positiveActivities = summary?.topPositiveActivities ?? []
                        let paddedActivities = positiveActivities + Array(repeating: "—", count: max(0, 2 - positiveActivities.count))
                        
                        ForEach(paddedActivities.prefix(2), id: \.self) {
                            activity in
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 350.0, height: 40.0)
                                    .foregroundColor(Color("Buttons"))
                                Text(activity)
                                    .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                                    .foregroundColor(Color("Background"))
                                    .kerning(0.5)
                            }
                        }
                        
                        Text("habit to improve on")
                            .foregroundColor(Color("BrighterYellow"))
                            //.font(.title3)
                            //.fontWeight(.bold)
                            .padding(.top, 15)
                            .kerning(0.5)
                            .font(.lexend(fontStyle: .headline, fontWeight: .bold))
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 350.0, height: 40.0)
                                .foregroundColor(Color("Buttons"))
                            Text(summary?.topNegativeActivity ?? "—")
                                .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
                                .foregroundColor(Color("Background"))
                                .kerning(0.5)
                        }
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    AppView()
}
