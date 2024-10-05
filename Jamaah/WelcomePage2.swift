//
//  Untitled.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 27/03/1446 AH.
//

import SwiftUI

struct WelcomePage2: View {
    
    @State private var name: String = "" //To store the user's name
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image("1")
                .offset(y:-140)
                Text("Enter Your Name:")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .offset(y:-190)

                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Added style for better appearance
                    .padding()
                    .offset(y:-220)
                    .frame(width: 300)
                NavigationLink(destination: UserNamePage(name: name)) {
                    Text("Let's Go") // Button to navigate
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 60)
                .offset(y:-230)
            }
        }
    }
}
#Preview {
    WelcomePage2()
}
