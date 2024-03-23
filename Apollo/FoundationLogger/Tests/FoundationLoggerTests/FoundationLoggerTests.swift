@testable import FoundationLogger
import XCTest

final class FoundationLoggerTests: XCTestCase, LoggerInjected {
    @MainActor
    func testLogger() {
        XCTAssertNotNil(logger)

        logger.logInfo("Log information.")

        logger.logWarn("Log warning.")

        // AudioError
        logger.handleError(AudioError(.soundNotFound, ErrorLine()))
        logger.handleError(AudioError(.failedToLoadSound, ErrorLine()))

        // FileError
        logger.handleError(FileError(.fileNotFound(fileName: "test"), ErrorLine()))
        logger.handleError(FileError(.readingFileString, ErrorLine()))
        logger.handleError(FileError(.emptyString, ErrorLine()))
        logger.handleError(FileError(.readingJsonData, ErrorLine()))
        logger.handleError(FileError(.decodingJsonData(description: "test"), ErrorLine()))

        // HealthKitError
        logger.handleError(HealthKitError(.healthData, ErrorLine()))
        logger.handleError(HealthKitError(.quantityType, ErrorLine()))
        logger.handleError(HealthKitError(.authorization(description: "test"), ErrorLine()))
        logger.handleError(HealthKitError(.query(description: "test"), ErrorLine()))

        // LocalizationError
        logger.handleError(LocalizationError(.pathNotFound, ErrorLine()))
        logger.handleError(LocalizationError(.bundleNotFound, ErrorLine()))
    }
}
