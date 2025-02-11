//
//  ContentView.swift
//  Lab1_Brendan_Dasilva
//
//  Created by Brendan Dasilva on 2025-02-11.
//

import SwiftUI

struct ContentView: View {
    // generate a random number between 1 and 100, inclusive
    @State private var number: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Text("\(number)")
                .font(.headline)
                .padding()
                .frame(width: 150, height: 100)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            HStack {
                Button("Prime") {
                    // add action here
                }
                .buttonStyle(.borderedProminent)
                
                Button("Not Prime") {
                    // add action here
                }
                .buttonStyle(.borderedProminent)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
