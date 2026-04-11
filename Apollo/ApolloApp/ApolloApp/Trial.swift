//
//  Trial.swift
//  ApolloApp
//
//  Created by Nikola Grujic on 11/04/2026.
//

import Foundation

private let key = "firstLaunchDate"

func getFirstLaunchDate() -> Date {
    #if DEBUG
    UserDefaults.standard.removeObject(forKey: key)
    #endif

    if let savedDate = UserDefaults.standard.object(forKey: key) as? Date {
        return savedDate
    } else {
        let now = Date()
        UserDefaults.standard.set(now, forKey: key)
        return now
    }
}

func getExpirationDate(days: Int = 7) -> Date? {
    let installDate = getFirstLaunchDate()
    return Calendar.current.date(byAdding: .day, value: days, to: installDate)
}

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMMM yyyy HH:mm"
    formatter.locale = Locale.current // or set a specific locale

    return formatter.string(from: date)
}
