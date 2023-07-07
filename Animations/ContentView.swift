//
//  ContentView.swift
//  Animations
//
//  Created by Adam Miller on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var message = Array("Drag me!")
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .frame(width: 300, height: 200)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
                .ignoresSafeArea()
            
            HStack(spacing: 0) {
                ForEach(0..<message.count) { i in
                    Text(String(message[i]))
                        .padding(5)
                        .font(.title)
                        .background(.purple)
                        .offset(dragAmount)
                        .animation(.default.delay(Double(i) / 20), value: dragAmount)
                }
            }
            .gesture(DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                }
            )
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
