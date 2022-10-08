//
//  TextFieldModel.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 07/10/2022.
//

import Foundation

struct TextFieldModel: Identifiable {
    var id = UUID()
    var input: String
    var isValidate: Bool = true
}
