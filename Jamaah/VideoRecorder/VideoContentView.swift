import SwiftUI

struct VideoContentView: View {
    @StateObject var viewModel = VideoContentViewModel()
    @State var isRecording = false
    
    // Accepting the selected activity and description from the previous view
    var selectedActivity: String
    var selectedDescription: String
    
    var body: some View {
        VStack {
            ZStack {
                // Background image
                Image("BG")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height / 2) // نصف ارتفاع الشاشة
                    .edgesIgnoringSafeArea(.all)
                
                // Transparent rectangle with activity description at the top
                VStack {
                    Rectangle()
                        .fill(Color.blue.opacity(0.4)) // شبه شفاف
                        .frame(height: 200)
                        .frame(width: 380)
                        .cornerRadius(50)
                    
                  
                        .overlay(
                            VStack {
                                Text(selectedActivity)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.bottom, 5)
                                
                                Text(selectedDescription)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                   
                            }
                        )
                        .padding(.top, 150) // Offset from top of the screen
                    
                    Spacer() // Push content to the top
                }
            }
            
            // الجزء السفلي المخصص للكاميرا
            ZStack {
                viewModel.preview?
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Spacer()
                    HStack{
                        Button(action: {
                            isRecording ? viewModel.stopRecording() : viewModel.startRecording()
                            isRecording.toggle()
                        }) {
                            Text(isRecording ? "Stop" : "Start")
                                .padding()
                                .frame(width: 90.0, height: 50.0)
                                .background(Color.blue.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }

                        Button(action: {
                            viewModel.toggleCamera()
                        }) {
                            Image(systemName: "camera.fill")
                                .padding()
                                .frame(width: 90.0, height: 50.0)
                                .foregroundColor(.white)
                                .background(Color.blue.opacity(0.7))
                                .cornerRadius(50)
                        }
                        .padding(.all, 20.0)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all) // تجاهل الحدود
    }
}

#Preview {
    VideoContentView(selectedActivity: "Go for a walk", selectedDescription: "Walking is a great way to clear your mind and get some exercise!")
}
