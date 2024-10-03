//
//  Untitled.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 27/03/1446 AH.
//

import SwiftUI

struct WelcomePage2: View {
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image("1")

                Text("Enter Your Name:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)

                TextField("Placeholder", text: .constant("")) // Updated placeholder
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Added style for better appearance
                    .padding()
                NavigationLink(destination: UserNamePage()) {
                    Text("Let's Go") // Button to navigate
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 60)
            }
        }
    }
}
#Preview {
    WelcomePage2()
}
