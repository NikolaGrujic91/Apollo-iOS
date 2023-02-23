//
//  PlansFileLoader.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

import ApolloLogger
import Foundation

final class PlansFileLoader: PlansLoadingProtocol, LoggerInjected {
    // MARK: - Properties

    private let fileName = "data"
    private let userDefaultsKey = "ApolloPlans"

    // MARK: - PlansLoadingProtocol

    func save(_ plans: [Plan]) {
        do {
            try trySave(plans)
        } catch let error as ErrorProtocol {
            logger.handleError(error)
        } catch {
            logger.handleError(error)
        }
    }

    func trySave(_ plans: [Plan]) throws {
        do {
            let data = try JSONEncoder().encode(plans)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            throw FileError(.encodingJsonData(description: error.localizedDescription), ErrorLine())
        }
    }

    func load() -> [Plan] {
        do {
            return try tryLoad()
        } catch let error as ErrorProtocol {
            logger.handleError(error)
        } catch {
            logger.handleError(error)
        }

        return [Plan]()
    }

    func tryLoad() throws -> [Plan] {
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey) {
            do {
                return try JSONDecoder().decode([Plan].self, from: jsonData)
            } catch {
                throw FileError(.decodingJsonData(description: error.localizedDescription), ErrorLine())
            }
        } else {
            guard let path = Bundle.module.path(forResource: fileName, ofType: "json") else {
                throw FileError(.fileNotFound(fileName: fileName), ErrorLine())
            }

            guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8) else {
                throw FileError(.readingFileString, ErrorLine())
            }

            if jsonString.isEmpty {
                throw FileError(.emptyString, ErrorLine())
            }

            guard let jsonData = jsonString.data(using: .utf8) else {
                throw FileError(.readingJsonData, ErrorLine())
            }

            do {
                return try JSONDecoder().decode([Plan].self, from: jsonData)
            } catch {
                throw FileError(.decodingJsonData(description: error.localizedDescription), ErrorLine())
            }
        }
    }

    func remove() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
