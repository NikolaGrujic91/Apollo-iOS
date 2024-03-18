//
//  StorageUserDefaults.swift
//  FoundationStorage
//
//  Created by Nikola Grujic on 14/03/2023.
//

import Foundation

final class StorageUserDefaults: StorageProtocol {
    // MARK: - StorageProtocol

    func set(_ value: String, forKey defaultName: String) {
        UserDefaults.standard.set(value, forKey: defaultName)
    }

    func set(_ value: Double, forKey defaultName: String) {
        UserDefaults.standard.set(value, forKey: defaultName)
    }

    func set(_ value: Data, forKey defaultName: String) {
        UserDefaults.standard.set(value, forKey: defaultName)
    }

    func get(forKey defaultName: String) -> String? {
        UserDefaults.standard.string(forKey: defaultName)
    }

    func get(forKey defaultName: String) -> Double {
        UserDefaults.standard.double(forKey: defaultName)
    }

    func get(forKey defaultName: String) -> Data? {
        UserDefaults.standard.data(forKey: defaultName)
    }

    func remove(forKey defaultName: String) {
        UserDefaults.standard.removeObject(forKey: defaultName)
    }
}
