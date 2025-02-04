//
//  ProfileView.swift
//  GeometryReader
//
//  Created by Skyler Robbins on 1/28/25.
//

import SwiftUI

struct ProfileView: View {
    let profile: Profile
    let width: Double
    let height: Double
    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow]
    
    var randomColor: Color {
        colors.randomElement()!
    }
    
    var body: some View {
        VStack {
            Image(systemName: profile.systemImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .padding(.top)
            
            Text(profile.name)
                .font(.headline)
                .padding(.top, 5)
            
            Text(profile.description)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
            
            Spacer()
        }
        .frame(width: width, height: height, alignment: .center)
        .background(Rectangle().fill(randomColor.opacity(0.25)))
        .cornerRadius(10)
    }
}
