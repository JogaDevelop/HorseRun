//
//  NotificationManager.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 20.05.2025.
//

import Foundation
import UserNotifications

struct NotificationManager {
    // MARK: - Variables in Context
    private static let center = UNUserNotificationCenter.current()

    public static func requestAuthorization(for options: UNAuthorizationOptions = [.alert, .sound, .badge]) async throws {
        try await center.requestAuthorization(options: options)
    }

    public static func getAuthorizationStatus() async -> UNAuthorizationStatus {
        let notificationSettings = await center.notificationSettings()
        return notificationSettings.authorizationStatus
    }

    public static func scheduleNotification(id: String, title: String, body: String, triggerDate: Date) {
        guard triggerDate > Date() else {
            print("Warning: triggerDate is not in the future. Notification will not be scheduled.")
            return
        }

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let timeInterval = triggerDate.timeIntervalSince(Date())
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification '\(title)' with ID '\(id)' scheduled for \(triggerDate).")
            }
        }
    }

    public static func removeAllPendingNotificationRequests() {
        center.removeAllPendingNotificationRequests()
        print("All pending notification requests removed.")
    }

    public static func removePendingNotificationRequests(ids: [String]) {
        center.removePendingNotificationRequests(withIdentifiers: ids)
        print("Removed pending notifications with IDs: \(ids.joined(separator: ", "))")
    }
}
