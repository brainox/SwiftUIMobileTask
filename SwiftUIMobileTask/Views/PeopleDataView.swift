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
    var body: some View {
        ZStack {
            VStack {
                List(personDataListViewModel.personDataObjectList) { person in
                    ListCell(person: person)
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("Search"), displayMode: .inline)
            .alert(item: $personDataListViewModel.appError) { appAlert in
                Alert(title: Text("Error"), message: Text("""
                            \(appAlert.errorString)
                            Please try again later!
                            """))
            }
        .searchable(text: $search)
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
