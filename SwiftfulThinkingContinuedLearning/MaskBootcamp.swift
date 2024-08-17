//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/17/24.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 3
    
    var body: some View {
        ZStack {
            starsView
        }
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(rating >= index ? Color.yellow : .gray)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
