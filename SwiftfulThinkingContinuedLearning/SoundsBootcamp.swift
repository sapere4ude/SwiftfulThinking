//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/18/24.
//

import SwiftUI
import AVKit


class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        player = AVAudioPlayer()
    }
}

struct SoundsBootcamp: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                
            }
            Button("Play sound 2") {
                
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
