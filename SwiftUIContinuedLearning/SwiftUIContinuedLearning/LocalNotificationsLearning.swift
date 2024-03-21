//
//  SwiftUIView.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 22/03/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    // This is a singleton
    static let instance = NotificationManager()
    
    func requestAuth() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(
            options: options) { success, error in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    print("Success: \(success)")
                }
            }
    }
    
    func scheduleNotifications() {
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This is was so easy"
        content.sound = .default
        content.badge = 8
        
        // three types of triggers that can be added
        // Time
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5.0,
            repeats: false)
        
        
        // Calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 1
//        dateComponents.minute = 35
//        let trigger = UNCalendarNotificationTrigger(
//            dateMatching: dateComponents,
//            repeats: true)
        
        
        // Location
//        let coordinates = CLLocationCoordinate2D(
//            latitude: 40.00,
//            longitude: 50.00)
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 100,
//            identifier: UUID().uuidString)
//        let trigger = UNLocationNotificationTrigger(
//            region: region,
//            repeats: true)
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationsLearning: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuth()
            }
            .padding()
            .font(.headline)
            .foregroundStyle(Color.white)
            .background(Color.black)
            .clipShape(Capsule())
            
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotifications()
            }
            .padding()
            .font(.headline)
            .foregroundStyle(Color.white)
            .background(Color.indigo)
            .clipShape(Capsule())
            
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotifications()
            }
            .padding()
            .font(.headline)
            .foregroundStyle(Color.white)
            .background(Color.red)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    LocalNotificationsLearning()
}
