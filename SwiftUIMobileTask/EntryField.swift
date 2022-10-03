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
    @Binding var field: String
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(placeholder, text: $field)
                .font(.body)
                .textInputAutocapitalization(.never)
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
            Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
        
    }
}

struct EntryField_Previews: PreviewProvider {
    static var previews: some View {
        EntryField(placeholder: "Email", prompt: "Enter a valid email", field: .constant(""))
    }
}
