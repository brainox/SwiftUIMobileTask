//
//  RandomListView.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PeopleDataView: View {
    @EnvironmentObject var authentication: Authentication
    @StateObject var personDataViewModel = PersonDataViewModel()
    @State private var search = ""
    var body: some View {
        VStack {
            List(personDataViewModel.personDataObjectList) { person in
                ListCell(person: person)
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle(Text("Search"), displayMode: .inline)
        .searchable(text: $search)
           
            
        
    }
}

struct RandomListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDataView()
    }
}
