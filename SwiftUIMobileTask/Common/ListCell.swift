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
    
    func address() -> String {
        let number = person.location?.street.number ?? 0
        let nonZeroNumber = number == 0 ? "" : String(number)
        let streetName = person.location?.street.name ?? ""
        let city = person.location?.city ?? ""
        let state = person.location?.state ?? ""
        let country = person.location?.country ?? ""
        return "\(nonZeroNumber) \(streetName) \(city) \(state) \(country)"
    }
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
                Text(address())
                
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
