//
//  ErrorLine.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public class ErrorLine: CustomStringConvertible {
    let file: String
    let function: String
    let line: Int
    let column: Int

    public init (
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
        return "[\(file):\(function):\(line):\(column)]"
    }
}
