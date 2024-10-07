//  UserNamePage.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 28/03/1446 AH.
//

import SwiftUI

struct UserNamePage: View {
    
    let name: String // To receive the name as a parameter
    
    var body: some View {
        
        
        
        ZStack{
            
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.2))
                .frame(width: 350, height: 750)
                .padding(.top, -40)
                .cornerRadius(50)
            
            
            Image("profile") // تأكد من وجود الصورة "Star" في الأصول
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.bottom, 400)
            
            VStack{
                Text((name))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue.opacity(0.7) )
                    .lineLimit(nil)
                    .shadow(radius:4)
                    .padding(.top, -40)
                
            }
            VStack{
                
                Text(" انت جاهز ؟")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.99, green: 0.90, blue: 0.8))
                    .shadow(radius:4)
                    .padding(.top, 70) // إضافة مسافة من الأعلى
                
            }
            
            VStack{
                Text("""
                             تقدر ترسل Airdrop الى اي شخص قريب منك  
                             وتبدا لعب
                             """)
                .font(.body)
                .shadow(radius:1)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top, 340) // إضافة مسافة من الأعلى
                .padding(.horizontal, 20) // إضافة مسافة جانبية
            }
            VStack{
                NavigationLink(destination: AirDrop()){
                    Text("ارسال Airdrop")
                        .frame(width: 230 , height: 7)
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.blue.opacity(0.7)  )
                        .foregroundColor(.white)
                        .cornerRadius(50) // زوايا مدورة
                        .padding(.top, 460) // إضافة مسافة من الأعلى
                }
                
                NavigationLink(destination: homeScreen()){ // اعدلها الهوم بيج
                    Text("Skip")
                        .fontWeight(.medium)
                        .foregroundColor(.blue) // لون النص
                        .padding(.top, 10) // إضافة مسافة من الأعلى
                }
            }.padding(.top, 40)
//                NavigationLink(destination: AirDrop()){
//                    Text("ارسال Airdrop")
//                        .frame(width: 230 , height: 7)
//                        .fontWeight(.semibold)
//                        .padding()
//                        .background(Color.blue.opacity(0.7)  )
//                        .foregroundColor(.white)
//                        .cornerRadius(50) // زوايا مدورة
//                        .padding(.top, 460) // إضافة مسافة من الأعلى
//                }
//                
//                NavigationLink(destination: homeScreen()){ // اعدلها الهوم بيج
//                    Text("Skip")
//                        .fontWeight(.medium)
//                        .foregroundColor(.blue) // لون النص
//                        .padding(.top, 570) // إضافة مسافة من الأعلى
//                }
        }}
    
    
}

#Preview {
    UserNamePage(name: "")
}
