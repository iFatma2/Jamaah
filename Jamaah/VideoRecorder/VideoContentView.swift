//
//  CameraViwe.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 30/03/1446 AH.
//

import SwiftUI

struct VideoContentView: View {
    @StateObject var viewModel = VideoContentViewModel()
    @State var isRecording = false
    
    var body: some View {
        VStack {
            // الجزء العلوي باللون الأسود
            Color.black
                .frame(height: UIScreen.main.bounds.height / 2) // نصف ارتفاع الشاشة
            
            // الجزء السفلي المخصص للكاميرا
            ZStack {
                viewModel.preview?
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Spacer()
                    
                    Button(action: {
                        isRecording ? viewModel.stopRecording() : viewModel.startRecording()
                        isRecording.toggle()
                    }) {
                        Text(isRecording ? "Stop" : "Start")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
//                    .padding()

                    Button(action: {
                        viewModel.toggleCamera()
                    }) {
                        Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90.camera.fill")
                            .padding()
                            .frame(width: 70.0, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all) // تجاهل الحدود
    }
}

#Preview {
    VideoContentView()
}
