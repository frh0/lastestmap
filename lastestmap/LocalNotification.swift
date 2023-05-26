//
//  LocalNotification.swift
//  lastestmap
//
//  Created by frh alshaalan on 26/05/2023.
//

import SwiftUI

struct LocalNotification {
    var title: String
    var subtitle: String?
    var body: String
    var sound: UNNotificationSound?
    var badgeNumber: Int?
    var delayInterval: TimeInterval?

    func schedule() {
        let content = UNMutableNotificationContent()
        content.title = title
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
        content.sound = sound ?? .default
        if let badgeNumber = badgeNumber {
            content.badge = NSNumber(integerLiteral: badgeNumber)
        }
        
        let trigger: UNNotificationTrigger
        if let delayInterval = delayInterval {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: delayInterval, repeats: false)
        } else {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        }
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
