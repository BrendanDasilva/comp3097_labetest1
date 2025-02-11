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
                Spacer().frame(height: 30)
                
                Text("\(number)")
                    .font(.system(size: 80, weight: .bold))
                    .padding()
                    .frame(width: 200, height: 120)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                Spacer().frame(height: 50)
                
                ZStack {
                    if showResult {
                        Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(isCorrect ? .green : .red)
                            .font(.system(size: 100))
                            .transition(.opacity)
                    }
                }
                .frame(height: 50) // fixed height to prevent shifting after button press
                
                Spacer().frame(height: 100)
                
                HStack(spacing: 20) {
                    Button("Prime") {
                        checkAnswer(isPrime: true)
                    }
                    .font(.title)
                    .padding()
                    .frame(width: 175, height: 80)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Not Prime") {
                        checkAnswer(isPrime: false)
                    }
                    .font(.title)
                    .padding()
                    .frame(width: 175, height: 80)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
