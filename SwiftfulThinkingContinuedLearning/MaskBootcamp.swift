//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/17/24.
//

import SwiftUI

/// mask 사용에 대한 공식 문서의 예제
///   Image(systemName: "envelope.badge.fill")
///    .foregroundColor(Color.blue)
///    .font(.system(size: 128, weight: .regular))
///    .mask(Rectangle().opacity(0.1))

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(
                    overlayView
                        .mask(starsView)
                )
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundColor(.yellow)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.yellow, Color.pink]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    //.foregroundColor(rating >= index ? Color.yellow : .gray)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
