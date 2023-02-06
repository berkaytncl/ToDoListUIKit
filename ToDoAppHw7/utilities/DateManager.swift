//
//  DateManager.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 5.02.2023.
//

import Foundation

final class DateManager {
    static let shared = DateManager()
    private init() {}
    
    func getLastModifiedTime(date: Date) -> String {
        let time = Date.now - date
        
        if time.month > 0 {
           return "\(time.month)mo"
        } else if time.day >= 7 {
            return "\(time.day / 7)w"
        } else if time.day > 0 {
            return "\(time.day)d"
        } else if time.hour > 0 {
            return "\(time.hour)h"
        } else if time.minute > 0 {
            return "\(time.minute)m"
        } else {
            return "\(time.second)sec"
        }
    }
}
