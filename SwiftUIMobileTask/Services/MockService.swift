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
            PersonDataObject(name: Name(first: "Mark", last: "Mart"), email: "hello@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Aaron", last: "Ngollo"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Rachel", last: "Philip"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Hosea", last: "King"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Blessed", last: "Joy"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Job", last: "Collins"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Elizabeth", last: "Bobs"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Cath", last: "Hemilton"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Yusuf", last: "Mbappe"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Ronaldo", last: "Christiano"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
            PersonDataObject(name: Name(first: "Messi", last: "Lionel"), email: "Pierc@gmail.com", picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg")),
        ]
    }
}
