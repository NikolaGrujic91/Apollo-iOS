//
//  Language.swift
//  FoundationLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

public enum Language: String, CaseIterable, Identifiable {
    case english = "en"
    case netherlands = "nl"

    public var id: Self { self }
}
