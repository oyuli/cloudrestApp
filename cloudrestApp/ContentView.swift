//
//  ContentView.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            // Use the preferred background color from 'main'
            Color(red: 0.133, green: 0.133, blue: 0.231)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text(Date(), style: .date)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white) // 'main' branch kept it clean and visible

                Text("here is a recap of your month so far")
                    .foregroundColor(.yellow)
                    .font(.subheadline)
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                        Text("number")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Text("your average amount of sleep")
                        .padding(.leading, 15)
                }
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                        Text("number")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Text("your longest rest so far")
                        .padding(.leading, 15)
                }
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 150.0)
                        Text("number")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Text("your average sleep quality")
                        .padding(.leading, 15)
                }
                
                Text("activities that improve your sleep")
                
                Button("listening to music") {
                    // Add action here
                }
                .font(.title2)
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(Color(hue: 0.702, saturation: 0.516, brightness: 0.953))
                
                Button("exercising") {
                    // Add action here
                }
                .font(.title2)
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(Color(hue: 0.702, saturation: 0.516, brightness: 0.953))
                
                Text("habit to improve on")
                
                Button("screentime before bed") {
                    // Add action here
                }
                .font(.title2)
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(Color(hue: 0.702, saturation: 0.516, brightness: 0.953))
                
                Spacer()
            }
            .padding()
        }
        .toolbar {
            // You can add toolbar items here
        }
    }
}

#Preview {
    ContentView()
}
