import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange.opacity(0.7), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 30) {
                    // Title
                    Text("Know where you wanna go but don't know what to bring?\nUse **Bagged.**\nPack like a pro! Plan like a boss and never forget your socks again!")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()

                    // Navigation Buttons
                    NavigationLink(destination: QuizView()) {
                        CustomButton(label: "Take the Quiz")
                    }

                    NavigationLink(destination: PackingListView()) {
                        CustomButton(label: "View Packing List")
                    }

                    NavigationLink(destination: AboutMeView()) {
                        CustomButton(label: "About the Creators")
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

//Button Style
struct CustomButton: View {
    var label: String

    var body: some View {
        Text(label)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.8))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            .padding(.horizontal, 30)
    }
}

#Preview {
    ContentView()
}
