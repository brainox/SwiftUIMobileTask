//
//  LoginViewModel.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var error: Authentication.AuthenticationError?
    @Published var credentials = Credentials()
    
    @Published var email         = ""
    @Published var password      = ""
    
    @Published var isEmailCriteriaValid      = false
    @Published var isPasswordCriteriaValid   = false
    @Published var canSubmit                 = false
    @Published var showProgressView          = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]{6,}$")
    
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
    
    var loginDisabled: Bool {
        isEmailCriteriaValid && isPasswordCriteriaValid
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
        "Must be at least 6 characters"
    }
    
    func login() {
        print("Logging in \(email)")
        email = ""
        password = ""
    }
//
    
//    func login(completion: @escaping (Bool) -> Void) {
//        showProgressView = true
//        
//        ApiService.shared.login(credentials: credentials) { [unowned self] (result: Result<Bool, Authentication.AuthenticationError>) in
//            showProgressView = false
//            
//            switch result {
//            case .success:
//                completion(true)
//            case .failure(let authError):
//                credentials = Credentials()
//                error = authError
//                completion(false)
//            }
//        }
//    }
    
}
