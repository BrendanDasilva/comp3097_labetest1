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
    
    // variables to track correct and incorrect answers
    @State private var correctAnswers: Int = 0
    @State private var wrongAnswers: Int = 0
    
    // variable for the 5-second timer - if user does not answer within 5 seconds, its recorded as an incorrect answer
    @State private var timer: Timer?
    
    
    var body: some View {
            VStack {
                Spacer().frame(height: 30) // add some space to the top of the screen
                
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
                
                Text("Correct: \(correctAnswers) | Wrong: \(wrongAnswers)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear(perform: startTimer)
        }
    

    // function to check answer and update the UI accordingly
    func checkAnswer(isPrime: Bool) {
        // compare the users input with the actual result of the prime number check
        let correct = isPrime == isPrimeNumber(number)
        
        // update the result state
        isCorrect = correct
        showResult = true
        
        if correct {
            correctAnswers += 1
        } else {
            wrongAnswers += 1
        }
        
        resetNumber()
    }
    
    
    // hide the result after 1 second and generate a new random number
    func resetNumber() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showResult = false
            number = Int.random(in: 1...100)
        }
    }
    
    
    // start timer
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            wrongAnswers += 1
            number = Int.random(in: 1...100)
        }
    }


    // function to check if the number is prime or not
    func isPrimeNumber(_ n: Int) -> Bool {
        // prime numbers greater than 1
        if n < 2 { return false }
        
        // check divisibility from 2 up to (but not including) n
        for i in 2..<n {
            if n % i == 0 { return false } // if divisible, it's not a prime number
        }
        return true // if no divisors were found, it's a prime number
    }
}




#Preview {
    ContentView()
}
