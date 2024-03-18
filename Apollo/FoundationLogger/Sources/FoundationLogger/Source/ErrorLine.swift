//
//  ErrorLine.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public final class ErrorLine: CustomStringConvertible {
    // MARK: - Properties

    let file: String
    let function: String
    let line: Int
    let column: Int

    // MARK: - Initializers

    public init(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        column: Int = #column
    ) {
        if let errorLocation = file.components(separatedBy: "/").last {
            self.file = errorLocation
        } else {
            self.file = file
        }

        self.function = function
        self.line = line
        self.column = column
    }

    // MARK: - CustomStringConvertible

    public var description: String {
        "[\(file):\(function):\(line):\(column)]"
    }
}
