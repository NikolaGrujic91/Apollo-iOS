//
//  HealthKitError.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public final class HealthKitError: Error {
    public enum HealthKitErrorType {
        case healthData
        case quantityType
        case authorization(description: String)
        case query(description: String)
    }

    let errorType: HealthKitErrorType

    public init(_ errorType: HealthKitErrorType, _ errorLine: ErrorLine) {
        self.errorType = errorType
        self.errorLine = errorLine
    }

    // MARK: - ErrorProtocol

    public var errorLine: ErrorLine
}

extension HealthKitError: ErrorProtocol {
    public var errorDescription: String? {
        switch errorType {
        case .healthData:
            return "Health data not available."
        case .quantityType:
            return "Quantity type not recognized."
        case let .authorization(description):
            return description
        case let .query(description):
            return description
        }
    }

    public var failureReason: String? {
        switch errorType {
        case .healthData:
            return "Health data not available on the device."
        case .quantityType:
            return "Quantity type not recognized on the device."
        case .authorization:
            return "Authorization not granted."
        case .query:
            return "Failed rading queries from HealthKit."
        }
    }

    public var recoverySuggestion: String? {
        switch errorType {
        case .healthData:
            return "Check if health data is supported on the device."
        case .quantityType:
            return "Check if quantity type is supported on the device and system."
        case .authorization:
            return "Check if authorization can be granted. Check plist."
        case .query:
            return "Check if there are any entries in the HealthKit."
        }
    }
}
