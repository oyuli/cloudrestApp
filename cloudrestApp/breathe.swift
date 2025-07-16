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
    @State private var buttonText: String = "Start"
    @State private var currentImage: String = "SheepClosed"
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(currentImage)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding([.top, .leading, .trailing], 30)
                    .padding(.bottom, 5.0)
                    .offset(y: imageOffset)
                
                Button(buttonText) {
                    startAnimation()
                }
                .foregroundColor(Color("Headings"))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 30.0)
                .kerning(2)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.5), value: buttonText)
            }
            
        }
    }
    
    func startAnimation() {
        
        buttonText = "Breathe in"
        
        let queue = DispatchQueue(label: "timerQueue")
        let timer = DispatchSource.makeTimerSource(queue: queue)
        
        //move image up
        withAnimation(.easeInOut(duration: 3)) {
            imageOffset = -340
        }
        
        //timer set up
        timer.setEventHandler {
            
            //Change text
            DispatchQueue.main.async {
                buttonText = "Hold"
            }
            
            //image hold 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                
                DispatchQueue.main.async {
                    buttonText = "Breathe out"
                    currentImage = "SheepOpen"
                }
                
                withAnimation(.easeInOut(duration: 3)) {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            buttonText = "Start"
            currentImage = "SheepClosed"
        }
        
    }
    
    
    
}

#Preview {
    AppView()
}
