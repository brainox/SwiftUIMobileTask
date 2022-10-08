//
//  ListCell.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCell: View {
    var person: PersonDataObject
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            WebImage(url: URL(string: person.picture?.medium ?? ""))
                .placeholder(Image(systemName: "photo"))
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity) // Activity Indicator
            
                .scaledToFit()
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(person.name?.first ?? "") \(person.name?.last ?? "")")
                Text(person.email ?? "")
                Text(person.location?.street.number)
                
            }
            .padding(.horizontal)
            
        }
        .padding(.vertical, 8)
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(person: PersonDataObject.mock())
    }
}
