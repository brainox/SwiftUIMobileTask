//
//  PersonDataViewModel.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import SwiftUI

class PersonDataViewModel: ObservableObject {
    @Published var personDataObjectList: [PersonDataObject] = []
    
    init() {
        personDataObjectList = MockService.shared.getData()
    }
}

