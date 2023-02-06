//
//  PlansStore.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class PlanStore {
    // MARK: - Properties

    var plans = [Plan]()

    // MARK: - Initializers

    init() {
        self.decode()
    }

    // MARK: - Helper methods

    internal func encode() -> Bool {
        do {
            try self.tryEncode()
            return true
        } catch let EncodingError.invalidValue(nil, context) {
            // An indication that an encoder or its containers could not encode the given value.
            print(context)
            return false
        } catch {
            print("Exception: \(error)")
            return false
        }
    }

    private func tryEncode() throws {
        if let data = try? JSONEncoder().encode(self.plans) {
            UserDefaults.standard.set(data, forKey: "ApolloPlans")
        }
    }

    private func decode() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                try self.tryDecode(path: path)
            } catch let DecodingError.dataCorrupted(context) {
                // An indication that the data is corrupted or otherwise invalid.
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                // An indication that a keyed decoding container was asked for an entry for the given key, but did not contain one.
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                // An indication that a non-optional value of the given type was expected, but a null value was found.
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context) {
                // An indication that a value of the given type could not be decoded because it did not match the type of what was found in the encoded payload.
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
    }

    private func tryDecode(path: String) throws {
        if let data = UserDefaults.standard.data(forKey: "ApolloPlans") {
            self.plans = try JSONDecoder().decode(Array<Plan>.self, from: data)
        } else {
            let jsonString = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
            let jsonData = jsonString.data(using: .utf8)!
            self.plans = try JSONDecoder().decode(Array<Plan>.self, from: jsonData)
        }
    }
}
