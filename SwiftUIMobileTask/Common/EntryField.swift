//
//  EntryField.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 03/10/2022.
//

import SwiftUI

struct EntryField: View {
    var placeholder: String
    var prompt: String
    var isPassword: Bool
    var borderColor: Color
    @Binding var field: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if isPassword {
                SecureField(placeholder, text: $field)
                    .font(.body)
                    .textInputAutocapitalization(.never)
                    .padding(8)
                    .background(Color(.secondarySystemBackground))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(borderColor, lineWidth: 1))
            } else {
                TextField(placeholder, text: $field)
                    .font(.body)
                    .textInputAutocapitalization(.never)
                    .padding(8)
                    .background(Color(.secondarySystemBackground))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(borderColor, lineWidth: 1))
            }
        
            Text(prompt)
                .foregroundColor(.red)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
    }
}

struct EntryField_Previews: PreviewProvider {
    static var previews: some View {
        EntryField(placeholder: "Email", prompt: "Enter a valid email", isPassword: false, borderColor: Color(.secondarySystemBackground), field: .constant(""))
    }
}
