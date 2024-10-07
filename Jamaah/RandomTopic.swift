
import SwiftUI

struct RandomTopic: View {
    @State private var rotation: Double = 0
    @State private var showAlert = false
    @State private var selectedTopic: String = ""
    @State private var selectedDescription: String = ""
    @State private var navigateToDetails = false
    
    // قاموس المواضيع
    let Topics: [String: String] = [
        "قد أحد قال لك كلمة والآن مأثره فيك؟": "فكر في كلمة أو نصيحة تغيرت بها حياتك.",
            "أكثر كلمة أسعدتك من أمك وأبوك؟": "تذكر لحظات أو عبارات دعم ومحبة من العائلة.",
            "سر صغير محد يعرف عنك؟": "شيء تخفيه أو تحافظ عليه لنفسك.",
            "كيف تعرفت على أفضل صديق لك؟": "فكر في كيف بدأت علاقتكما وكيف تطورت.",
            "جربت تصحى من النوم وأنت مبتسم بسبب حلم؟ أيش الحلم؟": "تذكر حلم جميل أو مفرح أثر فيك.",
            "شخص بيننا عيوبه هي مميزاته؟": "فكر في شخص لديه صفات غير تقليدية تعتبر مميزة.",
            "كل واحد من المجموعة يعبر عن صفتين في الطرف الثاني.": "تبادلوا الآراء حول الصفات الشخصية.",
            "لو الأحلام تتحقق ايش راح يكون حلمك؟": "تخيل ما هو الشيء الأهم اللي تبي تحقيقه.",
            "موقف محرج قد صار لك؟": "تذكر موقف غير مريح ويضحك.",
            "لو باقي اخر خمس دقايق من حياتك ايش اخر شي تسويه؟": "تخيل كيف راح تختار أن تقضي وقتك الأخير.",
            "مين اكثر شخص فينا يجيب العيد؟": "تذكروا المواقف اللي تسبب فيها شخص في الفوضى أو المواقف الغريبة.",
            "مين اكثر شخص في المجموعة يقدر يطلعك من المشكلة الي انت فيها؟": "تذكر الشخص اللي يقدم لك الدعم والمساعدة دائم.",
            "متى تكذب؟": "تذكر المواقف التي قد كذبت فيها.",
            "ايش هو أكبر تحدي واجهته في حياتك؟": "تذكر تحدي صارلك وكيف تغلبت عليه.",
            "ايش هو الشيء اللي دائماً تحاول تتجنبه؟": "فكر في الأمور اللي تفضل تبعد عنها أو تتجنبها."
        ]
    
    var body: some View {
            ZStack {
                Image("BG") // تأكد من وجود الصورة "BG" في الأصول
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 350, height: 750)
                    .padding(.top, -40)
                    .cornerRadius(50)
                
                
                
                
                VStack {
                    RandomTopicStar()
                    RandomTopicWheel(rotation: $rotation, showAlert: $showAlert, selectedTopic: $selectedTopic, selectedDescription: $selectedDescription, topics: Topics, navigateToDetails: $navigateToDetails)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("يلا نسولف"),
                        message: Text("\(selectedTopic)"),
                        primaryButton: .default(Text("يلا")) {
                            navigateToDetails = true
                        },
                        secondaryButton: .cancel(Text("عيد"))
                    )
                }
            }
            .navigationDestination(isPresented: $navigateToDetails) {
                TopicScreen(RTopic: selectedTopic, description2: selectedDescription)
            }
    }
}

struct RandomTopicStar: View {
    var body: some View {
        Image("Star") // تأكد من وجود الصورة "Star" في الأصول
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .padding(.bottom, 20)
    }
}

struct RandomTopicWheel: View {
    @Binding var rotation: Double
    @Binding var showAlert: Bool
    @Binding var selectedTopic: String
    @Binding var selectedDescription: String
    let topics: [String: String]
    @Binding var navigateToDetails: Bool
    
    var body: some View {
        Image("WheelTopic") // تأكد من وجود الصورة "wheel" في الأصول
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // تأخير 2 ثانية
            if let randomTopic = topics.randomElement() {
                selectedTopic = randomTopic.key
                selectedDescription = randomTopic.value
                showAlert = true // إظهار التنبيه بعد اختيار الموضوع
            }
        }
    }
}


#Preview {
    RandomTopic()
}
