//
//  Untitled.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 27/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0 // Tracks the rotation angle

    var body: some View {
        NavigationView { // Wrap in NavigationView
            ZStack {
                Image("BG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Image("3")
                    Image("Star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(rotation)) // Apply rotation effect based on the rotation variable
                        .offset(y: -0) // Offset the image upwards
                        .onAppear {  // Trigger this block when the view appears
                            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) { // Start a linear animation
                                rotation = 360 // Set the rotation to 360 degrees for a full rotation
                            }
                        }
                        .padding()

                    NavigationLink(destination: WelcomePage2()) { // Link to the second page
                        Text("Next") // Button to navigate to WelcomePage2
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

