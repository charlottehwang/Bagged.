//
//  SecondView.swift
//  navigation
//
//  Created by Aanya Jain on 7/24/25.
//

import SwiftUI

struct QuizView: View {
    @State private var selectedDestination = ""
    @State private var path: [String] = []
    
    let destinations = ["Iceland", "Hawaii", "Japan", "France"]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                
                VStack(spacing: 32) {
                    Text("Where are you going?")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    VStack(spacing: 12) {
                        ForEach(destinations, id: \.self) { destination in
                            Button {
                                selectedDestination = destination
                            } label: {
                                Text(destination)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(selectedDestination == destination ? Color.orange.opacity(0.7) : Color.gray.opacity(0.3))
                                    .foregroundColor(selectedDestination == destination ? .white : .primary)
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        path.append(selectedDestination)
                    } label: {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedDestination.isEmpty ? Color.blue.opacity(0.4) : Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    }
                    .disabled(selectedDestination.isEmpty)
                }
                .padding()
                .navigationDestination(for: String.self) { destination in
                    if destination == "Hawaii" {
                        PackingListView()
                    } else if destination == "Iceland" {
                        ExtraView1()
                    } else {
                        NextQuestionView(destination: destination)
                    }

                }

            }
            .navigationTitle("Take the Quiz")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                }
            }
            
        }
    }
    
    
    
    struct NextQuestionView: View {
        let destination: String
        
        var body: some View {
            VStack(spacing: 20) {
                Text("You selected: \(destination)")
                    .font(.title2)
                Text("Next question goes here!")
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Return to Home")
                        .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    QuizView()
}
