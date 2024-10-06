
import SwiftUI

struct RandomActivity: View {
    @State private var rotation: Double = 0
    @State private var showAlert = false
    @State private var selectedActivity: String = ""
    @State private var selectedDescription: String = ""
    @State private var navigateToVideoContentView = false

    // قاموس الأنشطة
    let Activities: [String: String] = [
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

    var body: some View {
            ZStack {
                Image("BG") // تأكد من وجود الصورة "BG" في الأصول
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    RandomActivityStar()
                    RandomActivityWheel(rotation: $rotation, showAlert: $showAlert, selectedActivity: $selectedActivity, selectedDescription: $selectedDescription, activities: Activities, navigateToVideoContentView: $navigateToVideoContentView)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("يلا نجرب"),
                        message: Text(selectedActivity),
                        primaryButton: .default(Text("يلا")) {
                            navigateToVideoContentView = true
                        },
                        secondaryButton: .cancel(Text("عيد"))
                    )
                }
            }
            .navigationDestination(isPresented: $navigateToVideoContentView) {
                VideoContentView() // Navigate to VideoContentView
            }
    }
}

struct RandomActivityStar: View {
    var body: some View {
        Image("Star") // تأكد من وجود الصورة "Star" في الأصول
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .padding(.bottom, 20)
    }
}

struct RandomActivityWheel: View {
    @Binding var rotation: Double
    @Binding var showAlert: Bool
    @Binding var selectedActivity: String
    @Binding var selectedDescription: String
    let activities: [String: String]
    @Binding var navigateToVideoContentView: Bool

    var body: some View {
        Image("wheel") // تأكد من وجود الصورة "wheel" في الأصول
            .resizable()
            .scaledToFit()
            .frame(width: 350, height: 350)
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut(duration: 2), value: rotation)
            .onTapGesture {
                spinWheel()
            }
            .padding(.top, 100)
    }
    
    func spinWheel() {
        let randomRotation = Double.random(in: 0...360)
        rotation += 360 + randomRotation
        
        // إضافة تأخير قبل إظهار التنبيه
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let randomActivity = activities.randomElement() {
                selectedActivity = randomActivity.key
                selectedDescription = randomActivity.value
                showAlert = true // إظهار التنبيه بعد اختيار النشاط
            }
        }
    }
}

#Preview {
    RandomActivity()
}
