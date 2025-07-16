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
