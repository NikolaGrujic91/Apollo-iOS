//
//  PlansRepository.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

import Foundation
import FoundationLogger
import FoundationStorage

@MainActor
final class PlansRepository: PlansRepositoryProtocol, LoggerInjected, StorageInjected {
    // MARK: - Properties

    private let fileName = "data"
    private let key = "ApolloPlans"

    // MARK: - PlansRepositoryProtocol

    func save(_ plans: [Plan]) {
        do {
            try trySave(plans)
        } catch let error as ErrorProtocol {
            logger.handleError(error)
        } catch {
            logger.handleError(error)
        }
    }

    private func trySave(_ plans: [Plan]) throws {
        do {
            let data = try JSONEncoder().encode(plans)
            storage.set(data, forKey: key)
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

    private func tryLoad() throws -> [Plan] {
        if let jsonData: Data = storage.get(forKey: key) {
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
        storage.remove(forKey: key)
    }
}
