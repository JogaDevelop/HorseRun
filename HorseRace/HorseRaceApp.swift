//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI
import UserNotifications 

@main
struct HorseRacingApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            TabbarView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                Task {
                    try? await NotificationManager.requestAuthorization(for: [.alert, .sound, .badge])
                }
            }
        }
    }
}
