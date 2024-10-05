//
//  TopicScreen.swift
//  Jamaah
//
//  Created by reham on 30/03/1446 AH.
//
import SwiftUI

// View to display a topic and its description
struct TopicScreen: View {
    let RTopic: String // Selected topic
    let description2: String // Corresponding description
    
    @State private var buttonPressed = false // State to track if the button is pressed
    @State private var doorOpen = false // State to track if the door is open
    
    var body: some View {
        ZStack {
            // Background image
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Hint button
                Button(action: {
                    buttonPressed.toggle()
                    doorOpen.toggle()
                }) {
                    Image("hint")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .padding(.top, 550.0)
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
                
                // Description display
                if buttonPressed {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 300, height: 70)
                            .padding(.top, -40)
                            .overlay(
                                Text(doorOpen ? description2 : "")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .padding(.top, -40)
                            )
                            .animation(.easeInOut, value: doorOpen)
                    }
                    .padding()
                    .transition(.slide)
                }
            }
            
            // Topic display
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 330, height: 200)
                    .padding(.top, 20)
                
                Text(RTopic) // Display the selected topic
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 20)
            }
            .offset(y: -55)
        }
    }
}

#Preview {
    TopicScreen(RTopic: "Go for a walk", description2: "Walking is a great way to clear your mind and get some exercise!") // Preview of the TopicScreen
}
