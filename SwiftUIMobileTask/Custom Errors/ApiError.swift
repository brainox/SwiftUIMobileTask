//
//  ApiError.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 07/10/2022.
//

import Foundation

struct ApiError: Identifiable {
    let id = UUID().uuidString
    let errorString: String
}
