//
//  about.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct about: View {
    var body: some View {
        Text("about")
    }
}

#Preview {
    about()
}
ScrollView {
    VStack (alignment: .leading, spacing: 20) }
Text("Cloudiest - Sleep Traker")
    .font(.largeTitle
        .fontWeight(.bold)
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
         }
     }
}
