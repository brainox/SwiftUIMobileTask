//
//  ContentView.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView {
            VStack(spacing: 18) {
                EntryField(placeholder: "Email", prompt: loginVM.emailPrompt, field: $loginVM.email)
                EntryField(placeholder: "Password", prompt: loginVM.passwordPrompt, field: $loginVM.password)
                
                NavigationLink(destination: PeopleDataView()) {
                    Text("Login")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color.black).opacity(0.8))
                    .foregroundColor(Color.white)
                }
                .disabled(!loginVM.loginDisabled)
 
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
