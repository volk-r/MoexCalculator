//
//  ContentView.swift
//  MoexCalculator
//
//  Created by Roman Romanov on 29.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State var color = Color.green
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Привет, Практикум!")
                .padding()
                .foregroundColor(color)
            Button("Нажми здесь!") {
                if color == .green {
                    self.color = .orange
                } else {
                    color = .green
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
