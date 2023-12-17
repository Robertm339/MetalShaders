//
//  ContentView.swift
//  ShaderExamples
//
//  Created by Robert Martinez on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    let startDate = Date.now
    
    @State private var speed = 10.0
    @State private var strength = 10.0
    @State private var smoothing = 10.0
    
    var body: some View {
        VStack {
            TimelineView(.animation) { timeline in
                let elapsedTime = timeline.date.distance(to: startDate)
                
                Image(systemName: "figure.run.circle")
                    .font(.system(size: 300))
                    .foregroundStyle(.orange.gradient)
                    .waveEffect(elapsedTime: elapsedTime, speed: speed, strength: strength, smoothing: smoothing)
            }
            
            VStack {
                LabeledContent("Speed") {
                    Slider(value: $speed, in: 0...20)
                }
                
                
                LabeledContent("Strength") {
                    Slider(value: $strength, in: 0...20)
                }
                
                LabeledContent("Smoothing") {
                    Slider(value: $smoothing, in: 0...20)
                }
            }
            .padding()
            .textStyle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundGradient()
    }
}

#Preview {
    ContentView()
}
