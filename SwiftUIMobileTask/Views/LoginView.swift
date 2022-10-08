//
//  ContentView.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import SwiftUI

struct LoginFormError {
    var email: String = ""
    var password: String = ""
}

struct LoginView: View {
    @State var isLinkActive = false
    @State var email: String = ""
    @State var password: String = ""
    @State var loginFormError = LoginFormError()
    @State private var loginVM = LoginViewModel()
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 18) {
//                EntryField(placeholder: "Email", prompt: loginVM.emailPrompt, field: $loginVM.email)
//                EntryField(placeholder: "Password", prompt: loginVM.passwordPrompt, field: $loginVM.password)
                
//                NavigationLink(destination: PersonDataView()) {
//                    Text("Login")
//                        .bold()
//                        .frame(maxWidth: .infinity, maxHeight: 50)
//                        .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color.black).opacity(0.8))
//                    .foregroundColor(Color.white)
//                }
//                .disabled(!loginVM.loginDisabled)
                
                EntryField(placeholder: "Email", prompt: loginVM.emailError?.errorDescription ?? "", isPassword: false, field: $loginVM.email)
                
                EntryField(placeholder: "Password", prompt: loginVM.passwordError?.errorDescription ?? "", isPassword: true, field: $loginVM.password)
                
                NavigationLink(destination: PersonDataView(), isActive: $isLinkActive) {
                    Button ( action: {
                        if loginVM.isValid() {
                            self.isLinkActive = true
                        }
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                            .background(.black.opacity(0.8))
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}

struct LoginViewView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
