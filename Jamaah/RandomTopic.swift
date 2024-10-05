//
import SwiftUI

// Main view that handles random topic selection
struct RandomTopic: View {
    @State private var rotation: Double = 0 // Tracks the rotation angle
    @State private var showAlert = false // State variable to track alert visibility
    @State private var selectedTopics: String = "" // State to store the selected topic
    @State private var selectedDescription: String = "" // State to store the selected description
    
    // Dictionary of topics and their corresponding descriptions
    let topics: [String: String] = [
        "Go for a walk": "Walking is a great way to clear your mind and get some exercise!",
        "Read a book": "Reading helps you relax, learn, and expand your imagination.",
        "Watch a movie": "Movies can transport you to different worlds and provide entertainment.",
        "Cook a new recipe": "Try cooking a new recipe and surprise yourself with new flavors.",
        "Do a puzzle": "Puzzles are fun and great for sharpening your problem-solving skills.",
        "Try yoga": "Yoga is a peaceful practice that helps both the body and the mind.",
        "Write in a journal": "Writing helps you organize your thoughts and reflect on your day.",
        "Meditate": "Meditation is a calming practice to help you focus and destress.",
        "Listen to a podcast": "Podcasts are a great way to learn new things and be entertained.",
        "Draw something": "Drawing allows you to express your creativity and ideas visually.",
        "Learn a new language": "Learning a new language opens up new opportunities and cultures.",
        "Plan your week": "Planning helps you stay organized and makes your goals achievable.",
        "Call a friend": "Reaching out to a friend can brighten your day and strengthen your bond.",
        "Organize a room": "A clean and organized room helps you feel more productive and relaxed.",
        "Play a board game": "Board games are fun, especially with friends or family.",
        "Learn a new skill": "Developing new skills helps you grow and opens new opportunities.",
        "Take a nap": "A short nap can recharge your energy and improve your mood.",
        "Do some gardening": "Gardening connects you with nature and can be very fulfilling.",
        "Go for a bike ride": "Biking is a great way to exercise and explore your surroundings.",
        "Try a new hobby": "Exploring new hobbies can lead to discovering hidden talents."
    ]
    
    // Enum for navigation handling
    enum Route {
        case topic
    }
    
    @State private var path = [Route]() // Navigation path to track the stack
    var body: some View {
            NavigationStack(path: $path) {
                ZStack {
                    // Background image
                    Image("BG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        // Star image
                        Image("Star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, -20)
                        
                        // Wheel image for spinning
                        Image("wheel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                            .rotationEffect(.degrees(rotation)) // Rotate the wheel
                            .animation(.easeOut(duration: 2), value: rotation) // Animate the rotation
                            .onTapGesture {
                                spinWheel() // Spin the wheel on tap
                            }
                            .padding(.top, 120)
                    }
                    .blur(radius: showAlert ? 20 : 0)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("يلا نجرب"),
                            message: Text(selectedTopics),
                            primaryButton: .default(Text("يلا")) {
                                path.append(.topic) // Navigate to TopicScreen when user clicks "يلا"
                            },
                            secondaryButton: .cancel(Text("عيد")) // Action for "Cancel" button
                        )
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .topic:
                        TopicScreen(RTopic: selectedTopics, description2: selectedDescription) // Navigate to TopicScreen
                    }
                }
            }
        }
        
        // Function to spin the wheel
        func spinWheel() {
            let randomRotation = Double.random(in: 0...360) // Random rotation amount
            rotation += 360 + randomRotation // Update the rotation angle
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Delay for 2 seconds
                if let randomTopics = topics.randomElement() {
                    selectedTopics = randomTopics.key // Select the random topic
                    selectedDescription = randomTopics.value // Select its corresponding description
                } else {
                    selectedTopics = "No Topics found"
                    selectedDescription = "No description available."
                }
                showAlert = true // Show alert with the selected topic
            }
        }
    }

    #Preview {
        RandomTopic() // Preview of the RandomTopic view
    }
