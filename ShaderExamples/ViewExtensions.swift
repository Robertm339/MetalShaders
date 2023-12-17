//
//  ViewExtensions.swift
//  ShaderExamples
//
//  Created by Robert Martinez on 12/16/23.
//

import SwiftUI

extension View {
    func waveEffect(elapsedTime: Double = 0, speed: Double = 10, strength: Double = 10, smoothing: Double = 10) -> some View {
        self
            .drawingGroup()
            .distortionEffect(
                ShaderLibrary.wave(
                    .float(elapsedTime),
                    .float(speed),
                    .float(strength),
                    .float(smoothing)
                ),
                maxSampleOffset: CGSize(width: strength, height: strength)
            )
    }
    
    func backgroundGradient() -> some View {
        self
            .background(LinearGradient(colors: [.mint, .mint, .black], startPoint: .top, endPoint: .bottom))
    }
    
    func textStyle() -> some View {
        self
            .fontWeight(.semibold)
            .foregroundStyle(.white)
    }
}
