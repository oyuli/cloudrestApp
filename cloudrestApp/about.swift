//
//  about.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI


struct about: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("cloudrest - Sleep Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 0.851, green: 0.765, blue: 0.416))
                Text("Welcome to Cloudiest, your companion for restful nights and mindful sleep tracking.")
                Group {
                    Text("Our Mission")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                    Text("We help you understand and improve your sleep habits with a simple, calm design.")
                    Text("Design vision")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                    Text("Sweet dreams")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.yellow)
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
            }
            .padding()
        }
    }
}
#Preview {
    about()
}
joyeta-dev
          ScrollView {
              VStack<<#Content: View#>> (alignment: .leading, spacing: 20, content: <#() -> _#>) }
Text("Cloudiest - Sleep Traker")
    .font(.largeTitle
        .fontWeight(bold)
        .foregroundColor (.yellow)
          Text("Welcome to Cloudiest, your companion for restful nights and mindful sleep tracking.")
        .font(.body)
         
          Group {
        Text ("Our Mission")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.purple)
        
        Text("We help you understand and impove your sleep habits with a simple, clam and design")
        Text("Design vision")
            .font(.title2)
            .fontWeigght(.semibold)
            .foregroundColor(.purple)
        
        Text("sweet dreams")
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.yellow)
    }
        .padding()
        .background(Color.black)
        .foregroundColor(Color(UIColor)
                         
                         
                         import SwiftUI
                         
                         struct ContentView: View {
        var body: some view {
            ZStack {
                color (#colorLitersl (red : 0.13, green: 0.12, blue: 0.24, alpha1))
                    .ignoresSafeArea()
                VStack(aligment: .leading, spacing:24) {
                    // Header
                    HStack {
                        Text("july 17")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                              
                    }
                    
                    // The problem section
                    VStack(alignment: .leading, spacing:16) {
                        Text("the problem")
                            .foregroundColor(.yellow)
                            .font(.headline)
                        ProblemRow(percentage: "73%", description: "of adolescents are not sufficiently resting")
                        ProblemRow(percentage: "33%", desription: "of adults sleep <7 hrs daily")
                        ProblemRow(percentage: "75%",description: "of older adults experience symptoms of insomnia")
                        
                        Text("Drowsy driving is  responsible for 6,000+ fatal car crashes yearly in the U.S")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fixedSize(horizonntal: false, vertical: true)
                    }
                    
                    // Solution Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("our solution")
                            .foregroundColor(.yellow)
                            .font(.headline)
                        
                        Button(action: {
                            // Our action here
                        }) {
                            Text("motivate users to care for their sleep health")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .backgroundColor(red: 0.43, green: 0.46, blue: 0.91, alphz:1)))
                                .forgroundColor(white)
                                .cprmerRadius(20)
                            
                        }
                        Button(action)
                        // Our action here
                    }) {
                        Text("guide users to improve their sleeping habits")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(colorLiteral(red: 0.43, green: 0.46, blue: 0.91, alpha: 1)))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }

