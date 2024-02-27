//
//  NotificationManager.swift
//  Project3
//
//  Created by Seana Marie Lanias on 12/11/22.
//

import Foundation
import SwiftUI

class NotificationManager: ObservableObject {
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if !success && error == nil {
                print("Notifications not permitted")
            }
        }
    }
    
    func scheduleNotification (title: String, notes: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = notes
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: "SW Species Notification", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.add(request)
    }
}
