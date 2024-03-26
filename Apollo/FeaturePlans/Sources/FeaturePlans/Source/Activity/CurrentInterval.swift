//
//  CurrentInterval.swift
//
//
//  Created by Nikola Grujic on 26/03/2024.
//

final class CurrentInterval {
    private var current: Int
    private var total: Int

    init(_ current: Int, _ total: Int) {
        self.current = current
        self.total = total
    }

    func get() -> Int {
        current
    }

    func getTotal() -> Int {
        total
    }

    func getDisplay() -> Int {
        current + 1
    }

    func reset() {
        current = 0
    }

    func next() {
        if isLast() {
            return
        }

        current += 1
    }

    func isLast() -> Bool {
        current >= total
    }
}
