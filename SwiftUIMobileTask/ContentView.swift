//
//  ContentView.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        VStack(spacing: 18) {
            EntryField(placeholder: "Email", prompt: "", field: $viewModel.email)
            EntryField(placeholder: "Password", prompt: "", field: $viewModel.password)
            
            Button {
                
            } label: {
                 Text("Login")
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .padding(.vertical)
            .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color.black).opacity(0.8))
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
