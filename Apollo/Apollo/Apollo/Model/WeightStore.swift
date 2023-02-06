//
//  WeightStore.swift
//  Apollo
//
//  Created by Nikola Grujic on 13/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import Foundation

class WeightStore {
    // MARK: - Properties

    var weight: Weight!

    // MARK: - Initializers

    init() {
        self.decode()
    }

    // MARK: - Helper methods

    internal func encode() {
        do {
            try self.tryEncode()
        } catch let EncodingError.invalidValue(nil, context) {
            // An indication that an encoder or its containers could not encode the given value.
            print(context)
        } catch {
            print("Exception: \(error)")
        }
    }

    private func tryEncode() throws {
        if let data = try? JSONEncoder().encode(self.weight) {
            UserDefaults.standard.set(data, forKey:"ApolloWeight")
        }
    }

    private func decode() {
        do {
            try self.tryDecode()
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
    
    private func tryDecode() throws {
        if let data = UserDefaults.standard.data(forKey: "ApolloWeight") {
            self.weight = try JSONDecoder().decode(Weight.self, from: data)
        } else {
            self.weight = Weight()
        }
    }
}
