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
    
    var listData: [PersonDataObject] {
        if (personDataListViewModel.searchTerm.isEmpty) {
            return personDataListViewModel.personDataObjectList
        } else {
            return personDataListViewModel.searchResults
        }
    }
    var body: some View {
        ZStack {
            VStack {
                List(listData) { person in
                    ListCell(person: person)
                }
                .listStyle(GroupedListStyle())
                .animation(.default, value: personDataListViewModel.searchTerm)
            }
            .navigationBarTitle(Text("Search"), displayMode: .inline)
            .alert(item: $personDataListViewModel.appError) { appAlert in
                Alert(title: Text("Error"), message: Text("""
                            \(appAlert.errorString)
                            Please try again later!
                            """))
            }
            .searchable(text: $personDataListViewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .always))
          
            if personDataListViewModel.isLoading {
                ZStack {
                    Color(.white)
                        .opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView("Fetching Random Persons")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(.systemBackground)))
                        .shadow(radius: 10)
                }
            }
        }
       
        
    }
}

struct RandomListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDataView()
    }
}
