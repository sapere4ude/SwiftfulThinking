//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/14/24.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    func gerPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        // GeometryReader 는 현재 디바이스의 사이즈를 알려줌. 그래서 디바이스 로테이션이 동작해도 그에 맞게 width, height 가 동작함. 하지만 동작 자체가 무겁기 떄문에 정말 필요한 상황에서만 호출해서 사용하는걸 권장
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.666)
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: gerPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300,height: 250)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
