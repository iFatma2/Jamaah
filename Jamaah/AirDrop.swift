//
//  AirDrop.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 28/03/1446 AH.
//

import SwiftUI

struct AirDrop: View {
    
    @State private var showingShareSheet = false
    let message = "يلا نجتمع مع بعض ونلعب لعبة حلوة 🎮📱 مستعدين! 🔥😎"
    @State private var isBouncing = false // State for bounce animation
    
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
            
            
            VStack {
                // Share icon with bounce effect
                Image("Airdrop")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -140)
                    .frame(width: 300, height: 300) // Adjust size
                    .foregroundColor(.red) // Change color to red
                    .scaleEffect(isBouncing ? 1.1 : 1.0) // Bounce effect
                    .animation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true), value: isBouncing)
                    .onAppear {
                        isBouncing = true // Start bouncing when the view appears
                    }
                  
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
                    .padding(.horizontal, 10) // إضافة مسافة جانبية
                    .offset(y: -50)
                    
                }
                VStack{
                    Button(action: {
                        showingShareSheet = true
                    }) {
                        Text("ارسال AirDrop")
                            .frame(width: 270 , height: 30)
                            .background(Color.blue.opacity(0.7)  )
                            .foregroundColor(.white)
                            .cornerRadius(50)

                    }
                    .sheet(isPresented: $showingShareSheet) {
                        ActivityView(items: [message])
                    }
                    NavigationLink(destination: homeScreen()){ // اعدلها الهوم بيج
                        Text("Continue")
                            .frame(width: 230 , height: 30)
                            .fontWeight(.medium)
                            .foregroundColor(.blue) // لون النص
                            .padding(.top, 15) // إضافة مسافة من الأعلى
                        
                            
                    }
                    
                   
                }.padding(.top, 460)
                
            }
        }}

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
