//
//  CustomGeometryReader.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/15/24.
//

import SwiftUI

struct CustomGeometryReader: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { 
            HStack(spacing: 20) {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        let scale = calculateScale(geometry: geometry)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 370 * scale)
                            .animation(.easeOut(duration: 0.2), value: scale)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 450)
                }
            }
            .padding()
        }
    }
    
    func calculateScale(geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let screenWidth = UIScreen.main.bounds.width
        
        let distance = abs(midX - screenWidth / 2)
        let threshold: CGFloat = 100 // 중앙에서 얼마나 멀리 떨어져야 크기를 줄일지 결정하는 임계값
        let scaleFactor: CGFloat = 0.2
        
        if distance < threshold {
            return 1 + scaleFactor * (1 - distance / threshold)
        } else {
            return 1.0 // 중앙에서 벗어나면 이 크기로 유지
        }
    }
}

#Preview {
    CustomGeometryReader()
}
