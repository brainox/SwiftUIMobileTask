//
//  MockService.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import Foundation

class MockService {
    static let shared = MockService()
    
    func getData() -> [PersonDataObject] {
        return [
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            
        ]
    }
}
