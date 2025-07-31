import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Smooth Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange.opacity(0.8), Color.pink.opacity(0.7), Color.blue.opacity(0.9)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 25) {
                    // App Title / Tagline
                    VStack(spacing: 10) {
                        Text("Bagged.")
                            .font(.system(size: 42, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Know where you wanna go but don't know what to bring?")
                            .font(.title3)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Text("Pack like a pro. Plan like a boss.")
                            .fontWeight(.medium)
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.top, 50)

                    // Buttons with Icons
                    VStack(spacing: 18) {
                        NavigationLink(destination: QuizView()) {
                            CustomButton(label: "Take the Quiz", icon: "questionmark.circle.fill")
                        }

                        NavigationLink(destination: PackingListView()) {
                            CustomButton(label: "Saved Packing List", icon: "list.bullet.rectangle.fill")
                        }

                        NavigationLink(destination: AboutMeView()) {
                            CustomButton(label: "About the Creators", icon: "person.3.fill")
                        }
                    }
                    .padding(.top, 30)

                    Spacer()

                    // Bottom Image
                    Image("Bagged")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
            }
            .navigationBarHidden(true)
        }
    }
}

// Enhanced Button Style with Icons
struct CustomButton: View {
    var label: String
    var icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            Text(label)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.85), Color.gray.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 5)
        .padding(.horizontal, 15)
    }
}

#Preview {
    ContentView()
}
