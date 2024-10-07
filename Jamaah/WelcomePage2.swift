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
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.2))
                .frame(width: 350, height: 750)
                .padding(.top, -40)
                .cornerRadius(50)
            
                        
            Image("profile")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(y:-200)
                        
          

            VStack (spacing : 100) {
                TextField("  ادخل اسمك", text: $name)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Added style for better appearance
                .cornerRadius(50)
                .padding()
                .offset(y:140)
                .frame(width: 300)

                NavigationLink(destination: UserNamePage(name: name)) {
                    Text("يلا") // Button to navigate
                        .frame(width: 230 , height: 6)
                        .padding()
                        .background(Color.blue.opacity(0.7)  )
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        
                }
                .padding(.bottom, 60)
                .offset(y:40)
            }
        }
    }
}
#Preview {
    WelcomePage2()
}
