//
//  ContentView.swift
//  stemsters
//
//  Created by Aanya Jain on 7/22/25.
//

import SwiftUI

struct AboutMeView: View {

    var body: some View {
        ZStack {
            Color(.systemPurple)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 20.0) {
                    
                    HStack(spacing: 20.0) {
                        Image("Charlotte")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130)
                        //.cornerRadius(20)
                        //.padding(1)
                            .background(Rectangle() .foregroundColor(.white))
                            .cornerRadius(20)
                        Text("Charlotte Hwang")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                //    Spacer()
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius:15)
                .padding()
              
                VStack(alignment: .leading, spacing: 20.0) {
                    
                    HStack(spacing: 20.0) {
                        Image("aanya")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130)
                        //.cornerRadius(20)
                        //.padding(1)
                            .background(Rectangle() .foregroundColor(.white))
                            .cornerRadius(20)
                        Text("Aanya Jain")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                //    Spacer()
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius:15)
                .padding()
            }
            

   var body: some View {
           ZStack {
               Color(.systemPurple)
                   .ignoresSafeArea()
       
           VStack(alignment: .leading, spacing: 20.0) {
               Image("Charlotte")
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 80, height: 80)
                   //.cornerRadius(20)
                   //.padding(1)
                   .background(Rectangle() .foregroundColor(.white))
                   .cornerRadius(20)
                   //.padding(50)
               HStack(spacing: 20.0) {
                   Text("Charlotte Hwang")
                       .font(.title)
                       .fontWeight(.bold)
               }
               Spacer()
            }
           .padding()
           .background(Color.white)
            .cornerRadius(15)
            .shadow(radius:15)
            .padding()
               

            Spacer()
        }
    }
}

      



#Preview {
   ContentView()
}

