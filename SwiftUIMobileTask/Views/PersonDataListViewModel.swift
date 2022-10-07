//
//  PersonDataViewModel.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import Foundation

class PersonDataListViewModel: ObservableObject {
    @Published var personDataObjectList: [PersonDataObject] = []

    init() {
//        personzDataObjectList = MockService.shared.getData()
        for _ in (0 ..< 2) {
            getPersonData()
        }
        
    }

    func getPersonData() {
        let apiService: ApiService = ApiService.shared
        apiService.getJSON(urlString: "https://randomuser.me/api", completion: { (result: Result<PersonData, ApiService.ApiError>) in
            switch result {
            case .success(let person):
                DispatchQueue.main.async {
                    print("The results are \(person.results)")
                    self.personDataObjectList = person.results
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    print(errorString)
                }
            }
        })
    }
}

