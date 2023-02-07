import XCTest
@testable import ApolloLogger

final class ApolloLoggerTests: XCTestCase, LoggerInjected {
    func testLogger() {
        XCTAssertNotNil(logger)

        logger.logInfo("Log information.")

        logger.logWarn("Log warning.")

        // FetchError
        logger.handleError(FetchError(.noLinks, ErrorLine()))
        logger.handleError(FetchError(.emptyLink, ErrorLine()))
        logger.handleError(FetchError(.badUrl, ErrorLine()))
        logger.handleError(FetchError(.responseError(description: "404"), ErrorLine()))
        logger.handleError(FetchError(.responseBodyError, ErrorLine()))

        // FileError
        logger.handleError(FileError(.fileNotFound(fileName: "test"), ErrorLine()))
        logger.handleError(FileError(.readingFileString, ErrorLine()))
        logger.handleError(FileError(.emptyString, ErrorLine()))
        logger.handleError(FileError(.readingJsonData, ErrorLine()))
        logger.handleError(FileError(.decodingJsonData(description: "test"), ErrorLine()))

        // HtmlParserError
        logger.handleError(HtmlParseError(.emptyHtml, ErrorLine()))
        logger.handleError(HtmlParseError(.parseName, ErrorLine()))
        logger.handleError(HtmlParseError(.parseSize, ErrorLine()))
        logger.handleError(HtmlParseError(.parsePrices, ErrorLine()))
        logger.handleError(HtmlParseError(.parsePricePerUnit, ErrorLine()))
        logger.handleError(HtmlParseError(.parseAction, ErrorLine()))
        logger.handleError(HtmlParseError(.parseImage, ErrorLine()))

        // LocalizationError
        logger.handleError(LocalizationError(.pathNotFound, ErrorLine()))
        logger.handleError(LocalizationError(.bundleNotFound, ErrorLine()))
    }
}
