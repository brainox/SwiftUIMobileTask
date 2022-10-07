//
//  SwiftUIMobileTaskApp.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import SwiftUI

@main
struct SwiftUIMobileTaskApp: App {
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if !authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                PeopleDataView()
                    .environmentObject(authentication)
            }
        }
    }
}
