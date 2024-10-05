//
//  ActivityDetails.swift
//  Jamaah
//
//  Created by reham on 30/03/1446 AH.
//

import SwiftUI

struct ActivityDetails: View {
    let activity: String // Accepts the selected activity
    let description: String // Accepts the corresponding description
    
    @State private var buttonPressed = false
    @State private var doorOpen = false
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                
            VStack(spacing :0) {
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
                
                if buttonPressed {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 300, height: 70)
                            .padding(.top, -40)
                            .overlay(
                                Text(doorOpen ? description : "") // Use the passed description here
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
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 330, height: 200)
                    .padding(.top, 20)
                
                Text("\(activity)") // Use the passed activity here
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 20)
            }
            .offset(y:-55)
        }
    }
}

#Preview {
    ActivityDetails(activity: "Go for a walk", description: "Walking is a great way to clear your mind and get some exercise!")
}
