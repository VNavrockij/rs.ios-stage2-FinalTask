//
//  AppDelegate.swift
//  Universe Says
//
//  Created by Vitaliy 
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import UIKit

enum Constants {
    static let dayDateKey: String = "dayDateKey"
    static let stringIndexKey: String = "stringIndexKey"
}

let stringArray: [String] = [
    "Твой мир начинает пульсировать. Он чувствует, что внутри тебя сегодня есть дополнительная порция добра! У тебя есть ровно час, чтобы сделать доброе дело.",
    "Сколько лет ты мечтает освободиться от этого бремени? (да, именно то, что сейчас у тебя прошло прямой ассоциацией со словом «бремя» - и есть твой якорь. Отвязывай его от всей ноги! Смелее! Пусть сам идёт на дно! А у нас с тобой есть великие дела!",
    "Ой, ты думаешь, что случайности - случайны? Пффф. Нет. Все письма, что ты получаешь от меня приходят ВОВРЕМЯ. В нужный час. Береги меня, Человек. Твоя Вселенная.",
    "Уединись на пару минут. Пожалуйста. Послушай, как бьется Твоё сердце. Почувствуй его. Ты понимаешь как оно много делает каждый день? Работает для Тебя 24 часа в сутки. Скажи сейчас ему спасибо. Просто поблагодари его. Скажи, ему..как оно много для Тебя значит.",
    "Ты единственный автор того, что сейчас с Тобой происходит.",
    "А давай сегодня подарим кому-то цветы? Просто так..",
    "Нам бы книгу новую прочесть. Для роста Твоей удивительной личности. Сегодня и начнём.",
    "Сегодня день без сахара. Ты справишься. Я верю в тебя.",
    "Любишь сладкое? Купи себе сегодня большой торт."
]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Конфигурация User Defaults
        let userDefaults = UserDefaults.standard
        
        userDefaults.register(defaults: [
            Constants.dayDateKey: Date(timeIntervalSince1970: 0),
            Constants.stringIndexKey: 0
        ])
        
        /* */
        let dayDate: Date = userDefaults.object(forKey: Constants.dayDateKey) as! Date
        let stringIndex: Int = userDefaults.integer(forKey: Constants.stringIndexKey)
        let currentDate: Date = Date()
        //print("currentDate - \(currentDate)") //для проверки даты
        
        //  для теста вызываю функцию которая считает дни между датами,
        if dayDate.daysBetween(currentDate) > 1 {
            userDefaults.set(currentDate, forKey: Constants.dayDateKey)
            userDefaults.set(generateNewIndex(stringIndex), forKey: Constants.stringIndexKey)
        }
        
        //  строка из массива
        let string = stringArray[stringIndex]
        //print(string)
        
        
        
        registerForPushNotifications()
        return true
    }
    
    func registerForPushNotifications() {
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
        (granted, error) in
        //print("Permission granted: \(granted)")
      }
    }
    
}

extension AppDelegate {
    func generateNewIndex(_ currentIndex: Int) -> Int {
        var random: Int = 0
        repeat {
            random = randomIndex()
        } while currentIndex == random
        return random
    }
    
    func randomIndex() -> Int {
        let stringArrayCount = stringArray.count
        return Int.random(in: 0..<stringArrayCount)
    }
}

extension Date {
    // для дней
    func daysBetween(_ date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: date)
        
        return components.day!
    }
    
    // для теста метод где можно использовать секунды вместо дней
    func secondsBetween(_ date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second], from: self, to: date)
        
        return components.second!
    }
    

}
