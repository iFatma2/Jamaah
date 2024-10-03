//
//  AirDrop.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 28/03/1446 AH.
//

import SwiftUI

struct AirDrop: View {
    
    @State private var showingShareSheet = false
    let message = "Hello, you can send this message via AirDrop!"
    @State private var isBouncing = false // State for bounce animation
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Share icon with bounce effect
                Image(systemName: "shareplay")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust size
                    .foregroundColor(.red) // Change color to red
                    .scaleEffect(isBouncing ? 1.1 : 1.0) // Bounce effect
                    .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isBouncing)
                    .onAppear {
                        isBouncing = true // Start bouncing when the view appears
                    }
                
                Text("You can send an AirDrop to anyone \n near you to start playing.")
                    .font(.body)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    showingShareSheet = true
                }) {
                    Text("Send AirDrop")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showingShareSheet) {
                    ActivityView(items: [message])
                }
                .padding(.top, 20)
                
                NavigationLink(destination: VideoContentView()) {
                    Text("Test The Camera 📸♥️") // Button to navigate
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 60)
            }
            .padding()
        }
    }
}

struct ActivityView: UIViewControllerRepresentable {
    var items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return activityVC
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No updates needed
    }
}

#Preview {
    AirDrop()
}
