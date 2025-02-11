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
    
    // variables for result and correct choice
    @State private var showResult: Bool = false
    @State private var isCorrect: Bool = false
    
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
                    checkAnswer(isPrime: true)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Not Prime") {
                    checkAnswer(isPrime: false)
                }
                .buttonStyle(.borderedProminent)
            
            }
            .padding()
        
            if showResult {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isCorrect ? .green : .red)
                    .font(.largeTitle)
                    .padding()
            }
        }
    }

    // function to check answer
    func checkAnswer(isPrime: Bool) {
        let correct = isPrime == isPrimeNumber(number)
        isCorrect = correct
        showResult = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showResult = false
            number = Int.random(in: 1...100)
        }
    }


    // function to check if the number is prime or not
    func isPrimeNumber(_ n: Int) -> Bool {
        if n < 2 { return false }
        for i in 2..<n {
            if n % i == 0 { return false }
        }
        return true
    }
}




#Preview {
    ContentView()
}
