//
//  Trial.swift
//  ApolloApp
//
//  Created by Nikola Grujic on 11/04/2026.
//

import Foundation

func getAppInstallationDate() -> Date? {
    let fileManager = FileManager.default

    // Get Documents directory (created on first install)
    if let docsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        do {
            let attributes = try fileManager.attributesOfItem(atPath: docsURL.path)
            return attributes[.creationDate] as? Date
        } catch {
            print("Error fetching attributes: \(error)")
        }
    }

    return nil
}

func getExpirationDate(from date: Date, days: Int = 7) -> Date? {
    return Calendar.current.date(byAdding: .day, value: days, to: date)
}

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMMM yyyy HH:mm"
    formatter.locale = Locale.current // or set a specific locale

    return formatter.string(from: date)
}
