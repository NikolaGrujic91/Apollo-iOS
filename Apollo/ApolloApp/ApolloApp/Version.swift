//
//  Version.swift
//  ApolloApp
//
//  Created by Nikola Grujic on 29/03/2024.
//

import Foundation

enum Version {
    static func get() -> String {
        if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String,
            let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
            return "\(appVersion).\(buildNumber)"
        }

        return "1.0.0"
    }
}
