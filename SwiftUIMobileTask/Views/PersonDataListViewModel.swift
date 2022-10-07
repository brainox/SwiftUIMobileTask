//
//  PersonDataViewModel.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import Foundation

class PersonDataListViewModel: ObservableObject {
    
    struct AppError: Identifiable {
        let id = UUID().uuidString
        let errorString: String
    }

    @Published var personDataObjectList: [PersonDataObject] = []
    @Published var appError: AppError? = nil
    @Published var isLoading: Bool = false
    var tempPersonDataStore: [PersonDataObject] = []

    init() {
        for _ in (0 ... 2) {
            getPersonData()
        }
    }

    func getPersonData() {
        let apiService: ApiService = ApiService.shared
        self.isLoading = true
        apiService.getJSON(urlString: "https://randomuser.me/api", completion: { (result: Result<PersonData, ApiService.ApiError>) in
            switch result {
                
            case .success(let person):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.personDataObjectList.append(contentsOf: person.results)
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.appError = AppError(errorString: errorString)
                    }
                }
            }
        })
    }
}

