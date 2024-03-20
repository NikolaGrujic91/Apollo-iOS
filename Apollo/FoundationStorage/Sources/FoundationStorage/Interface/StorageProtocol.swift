//
//  StorageProtocol.swift
//  FoundationStorage
//
//  Created by Nikola Grujic on 14/03/2023.
//

import Foundation

@MainActor
public protocol StorageProtocol {
    func set(_ value: String, forKey defaultName: String)

    func set(_ value: Double, forKey defaultName: String)

    func set(_ value: Data, forKey defaultName: String)

    func get(forKey defaultName: String) -> String?

    func get(forKey defaultName: String) -> Double

    func get(forKey defaultName: String) -> Data?

    func remove(forKey defaultName: String)
}
