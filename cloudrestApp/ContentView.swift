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
                            .foregroundColor(Color("SmallBackground"))
                        Text("number")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Headings"))
                    }
                    Text("your average amount of sleep")
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
                        Text("number")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Headings"))
                    }
                    Text("your longest        rest so far")
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
                        Text("icon")
                            .fontWeight(.bold)
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
                        Text("activities that improve your sleep")
                            .foregroundColor(Color("Headings"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 1)
                            .kerning(1.5)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 350.0, height: 40.0)
                                .foregroundColor(Color("Buttons"))
                            Text("Listening to music")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Background"))
                                .kerning(1.12)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 350.0, height: 40.0)
                                .foregroundColor(Color("Buttons"))
                            Text("Exercising")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Background"))
                                .kerning(1.12)
                        }
                        
                        
                        
                        Text("habit to improve on")
                            .foregroundColor(Color("Headings"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 15)
                            .kerning(1.5)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 350.0, height: 40.0)
                                .foregroundColor(Color("Buttons"))
                            Text("Screentime before bed")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Background"))
                                .kerning(1.12)
                        }
                    }
                }
                //.frame(maxWidth: .infinity)
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
