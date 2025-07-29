//
//  ContentView.swift
//  navigation
//
//  Created by Aanya Jain on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is the root view")
                NavigationLink(destination: QuizView()) {
                    Text("Quiz")
                }
                NavigationLink(destination: PackingListView()) {
                    Text("Packing List")
                }
                NavigationLink(destination: AboutMeView()) {
                    Text("About Me")
                }
               


            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        }
    }
}

#Preview {
    ContentView()
}
