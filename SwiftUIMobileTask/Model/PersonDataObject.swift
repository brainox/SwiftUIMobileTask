//
//  PersonDataObject.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import Foundation

// MARK: - Human
struct Human: Decodable {
    let results: [PersonDataObject]
}

// MARK: - Name
struct PersonDataObject: Decodable, Identifiable {
    var id = UUID()
    let name: Name
    let email: String
    let picture: Picture
}

// MARK: - Name
struct Name: Decodable {
    let first, last: String
}

// MARK: - Picture
struct Picture: Decodable {
    let large: String
}

extension PersonDataObject {
    static func mock() -> PersonDataObject {
        PersonDataObject(name: Name(first: "Obinna", last: "Aguwa"), email: "macmartins081@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg"))
    }
}
