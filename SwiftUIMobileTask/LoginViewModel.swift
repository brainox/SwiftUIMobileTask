//
//  LoginViewModel.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email         = ""
    @Published var password      = ""
    
    @Published var isEmailCriteriaValid      = false
    @Published var isPasswordCriteriaValid   = false
    @Published var canSubmit                 = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]{8,}$")
    
    init() {
        $email
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isEmailCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .assign(to: \.isPasswordCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($isEmailCriteriaValid, $isPasswordCriteriaValid)
            .map { isEmailCriteriaValid, isPasswordCriteriaValid  in
                return (isEmailCriteriaValid && isPasswordCriteriaValid)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
    
    var emailPrompt: String {
        isEmailCriteriaValid ?
        ""
        :
        "Enter a valid email address"
    }
    
    var passwordPrompt: String {
        isPasswordCriteriaValid ?
        ""
        :
        "Must be at least 8 characters"
    }
    
    
    
}
