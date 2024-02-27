//
//  Project3App.swift
//  Project3
//
//  Created by Seana Marie Lanias on 12/7/22.
//

import SwiftUI

@main
struct Project3App: App {
    
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environmentObject(audioManager)
        }
    }
}
