//
//  UserNamePage.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 28/03/1446 AH.
//

import SwiftUI

struct UserNamePage: View {
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // تحسين شكل الأيقونة
                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150) // ضبط الحجم
                    .padding(.top, 50) // إضافة مسافة من الأعلى
                
                Text("Tala Are You Ready!!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding(.top, 20) // إضافة مسافة من الأعلى

                Text("You can send an Airdrop to anyone \n near you to start playing.")
                    .font(.body)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20) // إضافة مسافة جانبية
                
                NavigationLink(destination: AirDrop()){
                    Text("Send an airdrop invite")
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.red) // لون الخلفية
                        .foregroundColor(.white) // لون النص
                        .cornerRadius(10) // زوايا مدورة
                        .padding(.top, 20) // إضافة مسافة من الأعلى
                }
                
                NavigationLink(destination: Text("Destination")) { // اعدلها الهوم بيج
                    Text("Skip")
                        .fontWeight(.medium)
                        .foregroundColor(.blue) // لون النص
                        .padding(.top, 10) // إضافة مسافة من الأعلى
                }
            }
            .padding()
        }
    }
}

#Preview {
    UserNamePage()
}
