//
//  Profile.swift
//  GeometryReader
//
//  Created by Skyler Robbins on 1/28/25.
//

import Foundation
import SwiftUICore

struct Profile: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var systemImageName: String
}
