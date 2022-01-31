//
//  Notificacoes.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 31/01/22.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    let center = UNUserNotificationCenter.current()
    var defaults = UserDefaults.standard
    
    
    private override init() {
        super.init()
        center.delegate = self
    }
    
    func registerCategories() {
        let show = UNNotificationAction(identifier: "show", title: "Bora!", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        center.setNotificationCategories([category])
    }
    
    @objc func registroLocalNotifications() { //Para registrar a notificação no começo do app
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    func changeNotificationStatus(notificationId: NotificationIdentifier, isEnabled: Bool) {
        defaults.set(isEnabled, forKey: notificationId.rawValue)
        if isEnabled {
            registerNotification(identifier: notificationId)
        } else {
            self.center.removePendingNotificationRequests(withIdentifiers: [notificationId.rawValue])
            
        }
        
    }
    
    @objc func createLocalNotification(title: String, body: String, hour: Int, min: Int, identifier: String) {
        registerCategories()
        
        let content = UNMutableNotificationContent()
        content.title = title //titulo
        content.body = body //corpo
        content.categoryIdentifier = "Notificação" //string
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        //horarios
        var dateComponents = DateComponents()
        dateComponents.hour = 16
        dateComponents.minute = 58
//        dateComponents.weekday = 6 para pegar o dia da semana
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // pull out the buried userInfo dictionary
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                print("Default identifier")
                
            case "show":
                // the user tapped our "show more info…" button
                print("Show more information…")
                
            default:
                break
            }
        }
        completionHandler()
    }
    
    func registerNotification(identifier: NotificationIdentifier){
        switch (identifier) {
        case .Sexta: createLocalNotification(title: "Sextou!",
                                               body: "Tá pensando em dar um pião? Cola com o SPerifa.",
                                               hour: 16,
                                               min: 58,
                                             identifier: NotificationIdentifier.Sexta.rawValue)
        case .Sabado: createLocalNotification(title: "Salve, quebrada!",
                                                 body: "Vai dar um rolê hoje? Se liga no que eu tenho pra mostrar.",
                                                 hour: 16,
                                                 min: 59,
                                                 identifier: NotificationIdentifier.Sabado.rawValue)
        }
    }
}
