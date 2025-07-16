//
//  breathe.swift
//  cloudrestApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct breathe: View {
    
    @State private var imageOffset: CGFloat = 0 //image initial position
    @State private var timer: DispatchSourceTimer? //timer for animation
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("SheepClosed")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding([.top, .leading, .trailing], 30)
                    .padding(.bottom, 5.0)
                    .offset(y: imageOffset)
                
                Button("Start") {
                    startAnimation()
                }
                .foregroundColor(Color("Headings"))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 30.0)
                .kerning(2)
            }
        }
    }
    
    func startAnimation() {
        
        let queue = DispatchQueue(label: "com.example.timerQueue")
        let timer = DispatchSource.makeTimerSource(queue: queue)
        
        //move image up
        withAnimation(.easeInOut(duration: 3)) {
            imageOffset = -400
        }
        
        //timer set up
        timer.setEventHandler {
            //image hold 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 4)) {
                    imageOffset = 0
                }
            }
            timer.cancel()
        }
        
        //starts when image is up
        timer.schedule(deadline: .now() + 3)
        
        //activating timer
        self.timer = timer
        timer.activate()
        
    }
    
    
    
}

#Preview {
    breathe()
}
