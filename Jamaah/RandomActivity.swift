import SwiftUI

struct RandomActivity: View {
    @State private var rotation: Double = 0
    @State private var showAlert = false
    @State private var selectedActivity: String = ""
    @State private var selectedDescription: String = ""
    @State private var navigateToVideoContentView = false

    // قاموس الأنشطة
    let Activities: [String: String] = [
        "يلا نطبخ": "عندكم ٦ مكونات ( تونة -  مكرونة - ليمون - نوع من انواع الاجبان - خضار - كريمة طبخ ) كل واحد منكم يطبخ طبخه مختلفه من هذي المكونات فقط ",
        "يلا نطلع الفنان اللي داخلنا": " ⁠جهزوا ادوات الرسم و كل واحد يرسم شخص المجموعة تعرفه و خمنوا مين يطلع !",
        "نخترع قصة": "معاكم ٣ دقايق تكتبوا قصه بشرط كل واحد من المجموعة يكتب جملة وحده > تنعاد اللفه لين تخلص الـ٣ دقايق ",
        "خمن": " ⁠كل واحد من المجموعة يدندن اغنيه بدون اي كلمة و على الباقين يخمنوا الاغنيه",
        "حار بارد ": "على واحد من المجموعة  يخبي شي في مكان و باقي المجموعة تدور عليه بحيث لو قرب احد من المكان يقول حار ولو بعد يقول بارد ",
        "سمعتني ؟": "واحد من المجموعة يلبس السماعة و يشغل صوت يعزل اصوات المجموعه عنه، و باقي المجموعة يحاولوا يقولو ل جملة قصيرة مثلا  :  الكيلون في السيفون",
        " ⁠نتحجى لغات ": "كل واحد يحكي قصة أو موقف  بلهجة مختلفة (مثلاً اللهجة المصرية )",
        " ⁠نكتب شعر جماعي": "ورقة وقلم وكل شخص يكتب بيت شعري، بحيث يكون مرتبطا بالبيت الذي كتبه الشخص الذي قبله، حتى نصنع قصيدة جماعية.",
        "غمض عينك وذوق ": "غمض عين واحد من المجموعة وخليه يذوق الاشياء اللي تختاروها",
        "قلد وخمن ": "كل فرد يقلد شخص موجود في المجموعة، وعلى الباقي تخمين مين يقلد.",
        "مين أنا؟": "كل شخص يكتب اسم شخصية مشهورة على ورقة، ويلصقها على جبهة الشخص بجانبه دون أن يراها، ويجب على الجميع تخمين الشخصية بسؤال أسئلة نعم/لا.",
       
        "اغمز": "استخدموا القرعة و يطلع شخص واحد القاتل، يقتل المجموعة عن طريق الغمزه بدون ما ينقفط من الباقين و اذا انقفط يخسر",
       
        "يلا نخبز": "اختارو نوع حلا مثلا (كيك - كوكيز) و اخبزوها  مع بعض ",
       
        
        "الطبخ الغريب": " كل واحد من المجموعة يكتبوا مكونات طبخ غير متوقعة، و على المجموعة تطبخ سوا من هذه المكونات",
       
        
        
        " ميمز ": "شغلوا ميمز على الشاشه و اللي يضحك يدفع لصاحب الجوال”اللي مشغل التطبيق”  ٥ ريال",
        
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
            VideoContentView(selectedActivity: selectedActivity, selectedDescription: selectedDescription) // Pass selectedActivity and selectedDescription here
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
        Image("mmmm (1)") // تأكد من وجود الصورة "wheel" في الأصول
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
