//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/22/24.
//

import SwiftUI

// 타입 1
struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

// 타입 2
//struct MyCustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                // 타입 1
                ForEach(data, id: \.self) { item in // Hashable 프로토콜을 채택했을땐 \.self 사용이 가능해진다
                    Text(item.hashValue.description)
                        .font(.headline)
                }
                
                // 타입 2
//                ForEach(data) { item in
//                    Text(item.id)
//                        .font(.headline)
//                }
            }
        }
    }
}


#Preview {
    HashableBootcamp()
}
