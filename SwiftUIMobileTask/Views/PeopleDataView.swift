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
    @StateObject var personDataListViewModel = PersonDataListViewModel()
    @State private var search = ""
//    @StateObject private var personDataListViewModel = PersonDataListViewModel()
    var body: some View {
        VStack {
            List(personDataListViewModel.personDataObjectList) { person in
                ListCell(person: person)
            }
            .listStyle(GroupedListStyle())
//            ForEach(personDataListViewModel.personDataObjectList, id: \.Self) {
//                    Text("\($0)…")
//                }
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
