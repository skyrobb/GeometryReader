//
//  ContentView.swift
//  GeometryReader
//
//  Created by Skyler Robbins on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State var profiles: [Profile] = [
        Profile(name: "Mike Tyson", description: "Somehow lost to Jake Paul", systemImageName: "figure.boxing"),
        Profile(name: "Mr. Beast", description: "Gives away a BUNCH of money", systemImageName: "gift"),
        Profile(name: "Ryan", description: "Just some random programmer", systemImageName: "desktopcomputer.and.macbook"),
        Profile(name: "Kevin", description: "Gym Rat", systemImageName: "dumbbell"),
        Profile(name: "Mark Rober", description: "Science Nerd", systemImageName: "magnifyingglass"),
        Profile(name: "Ur mom", description: "Thine mother", systemImageName: "person.circle.fill")
    ]
    
    var numberOfColumns: Int {
        horizontalSizeClass == .compact ? 2 : 3
    }
    
    var body: some View {
        GeometryReader { geometry in
            let totalPadding: Double = 20
            let availableWidth = geometry.size.width - totalPadding
            let columnWidth = availableWidth / Double(numberOfColumns)
            let numberOfRows: Int = (profiles.count + numberOfColumns - 1) / numberOfColumns
            
            VStack {
                ForEach(0..<numberOfRows, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<numberOfColumns, id: \.self) { columnIndex in
                            let profileIndex = rowIndex * numberOfColumns + columnIndex
                            if profileIndex < profiles.count {
                                ProfileView(profile: profiles[profileIndex], width: columnWidth, height: geometry.size.height / 5)
                            } else {
                                Color.clear
                                    .frame(width: columnWidth, height: geometry.size.height / 5)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(width: geometry.size.width, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}




