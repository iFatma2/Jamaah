//
//  homeScreen.swift
//  Jamaah
//
//  Created by reham on 30/03/1446 AH.
//
import SwiftUI

struct homeScreen: View {
    @State private var navigateToRandomActivity = false // State to trigger navigation to RandomActivity
    @State private var navigateToRandomTopic = false // State to trigger navigation to RandomTopic
    @State private var showAlert = false // State to control the alert for the third button
    
    var body: some View {
//        NavigationStack {
            ZStack {
                Image("b8")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    Spacer()
                    Spacer()
                    
                    // Buttons
                    VStack(spacing: 16) {
                        // Navigate to RandomActivity when "يلا نجرب" is pressed
                        CustomButton(title: "يلا نجرب") {
                            navigateToRandomActivity = true
                        }
                        
                        // Navigate to RandomTopic when "سوالف" is pressed
                        CustomButton(title: "سوالف") {
                            navigateToRandomTopic = true
                        }
                        
                        // Show alert when "نلعب" is pressed
                        CustomButton(title: "نلعب") {
                            showAlert = true
                        }
                        .alert("قريبا", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                    .offset(y: 10)
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToRandomActivity) {
                RandomActivity() // Navigate to the Randomactivity view
            }
            .navigationDestination(isPresented: $navigateToRandomTopic) {
                RandomTopic() // Navigate to the RandomTopic view
            }
//        }
    }
}

// CustomButton component with an action
struct CustomButton: View {
    var title: String
    var action: () -> Void = {} // Action handler
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 90)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(20)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    homeScreen()
}
