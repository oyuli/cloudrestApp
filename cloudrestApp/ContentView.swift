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
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Icons"))
    
                Text("here is a recap of your month so far")
                    .foregroundColor(Color("Headings"))
                    .font(.title3)
                    .fontWeight(.bold)
                
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                            .foregroundColor(Color("SmallBackground"))
                        Text(summary != nil ? String(format: "%.1f h", summary!.averageDuration / 3600) : "-")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Headings"))
                    }
                    Text("your average daily rest")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                        .kerning(1.25)
                }
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                            .foregroundColor(Color("SmallBackground"))
                        Text(summary != nil ? String(format: "%.1f h", summary!.maxDuration / 3600) : "-")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Headings"))
                    }
                    Text("your longest rest so far")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                        .kerning(1.25)
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
                            .foregroundColor(Color("Headings"))
                    }
                    Text("your average sleep quality")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                        .kerning(1.25)
                }
                HStack {
                    VStack(alignment: .center, spacing: 10.0) {
                        Text("activities that improved your sleep")
                            .foregroundColor(Color("Headings"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 1)
                            .kerning(1.16)
                        
                        
                        ForEach(summary?.topPositiveActivities ?? ["-", "-"], id: \.self) { activity in
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 350.0, height: 40.0)
                                    .foregroundColor(Color("Buttons"))
                                Text(activity)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("Background"))
                                    .kerning(1.12)
                            }
                        }
                        
                        Text("habit to improve on")
                            .foregroundColor(Color("Headings"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 15)
                            .kerning(1.5)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 350.0, height: 40.0)
                                .foregroundColor(Color("Buttons"))
                            Text(summary?.topNegativeActivity ?? "-")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Background"))
                                .kerning(1.12)
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
