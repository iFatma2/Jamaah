import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0 // Tracks the rotation angle
    @State private var navigateToNextPage = false // State variable to control navigation

    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Image("3")
                        .resizable()
                        .scaledToFit()
                       
                        .padding()
                    
                    Image("Star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(rotation))
                        .onAppear {
                            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                                rotation = 360
                            }
                           
                            
                            // Navigate to the next page after 10 seconds
                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                navigateToNextPage = true
                            }
                        }
                        .padding()
                 
                    // The NavigationLink is replaced with a conditional navigation
                    NavigationLink(destination: WelcomePage2(), isActive: $navigateToNextPage) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
