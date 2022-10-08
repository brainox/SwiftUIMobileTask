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
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), location: Location(street: Street(number: 2158, name: "Provulok Ayvazovskogo"), city: "Blagovishchenske", state: "Zhitomirska", country: "Ukraine"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg", medium: "https://randomuser.me/api/portraits/med/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), location: Location(street: Street(number: 2158, name: "Provulok Ayvazovskogo"), city: "Blagovishchenske", state: "Zhitomirska", country: "Ukraine"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg", medium: "https://randomuser.me/api/portraits/med/men/47.jpg")),
            PersonDataObject(apiID: nil, name: Name(first: "OBi", last: "Ag"), location: Location(street: Street(number: 2158, name: "Provulok Ayvazovskogo"), city: "Blagovishchenske", state: "Zhitomirska", country: "Ukraine"), email: "Nee", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg", medium: "https://randomuser.me/api/portraits/med/men/47.jpg")),
            
        ]
    }
}
