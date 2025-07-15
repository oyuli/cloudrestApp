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
                        Text("number")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Text("your average amount of sleep")
                        .font(.headline)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
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
                        .font(.headline)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
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
                        .font(.headline)
                        .padding(.leading, 15)
                        .foregroundColor(Color("Buttons"))
                }
                HStack {
                    VStack(alignment: .center, spacing: 10.0) {
                        Text("activities that improve your sleep")
                            .foregroundColor(Color("Headings"))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Button("listening to music") {
                            
                        }
                        .foregroundColor(Color("Background"))
                        .font(.callout)
                        .buttonStyle(BorderedProminentButtonStyle())
                        .tint(Color("Buttons"))
                        
                        Button("exercising") {
                            
                        }
                        .foregroundColor(Color("Background"))
                        .font(.callout)
                        .buttonStyle(BorderedProminentButtonStyle())
                        .tint(Color("Buttons"))
                        
                        Text("habit to improve on")
                            .foregroundColor(Color("Headings"))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Button("screentime before bed") {
                            
                        }
                        .foregroundColor(Color("Background"))
                        .font(.callout)
                        .buttonStyle(BorderedProminentButtonStyle())
                        .tint(Color("Buttons"))
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        
        .toolbar {
            
        }
        
    }
}

#Preview {
    ContentView()
}
