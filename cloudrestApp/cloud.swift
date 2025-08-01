//
//  cloud.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct cloud: View {
    @EnvironmentObject var sleepData: SleepDataStore
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0) {
                Text("your streak!")
                    .font(.lexend(fontStyle: .title, fontWeight: .bold))
                    .foregroundColor(Color("Icons"))
                    //.padding(.top, 30.0)
                    
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/35.0/*@END_MENU_TOKEN@*/)
                        .fill(Color("SmallBackground"))
                        .frame(width: 350, height: 630)
                    
                    VStack {
                        Text("\(sleepData.currentStreak())")
                            .foregroundColor(Color("BrighterYellow"))
                            .padding(.top, 50.0)
                            .padding(.bottom, 10.0)
                            .font(.lexend(fontStyle: .largeTitle, fontWeight: .bold))
                            .kerning(3)
                            
                        Spacer()
                        
                        Text("days")
                            //.font(.system(size: 70))
                            //.fontWeight(.bold)
                            .foregroundColor(Color("BrighterYellow"))
                            .padding(.bottom, 70.0)
                            .font(.lexend(fontStyle: .largeTitle, fontWeight: .bold))
                            .kerning(3)
                    }
                    
                    Image("SheepWithLegs")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 600)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AppView()
}
