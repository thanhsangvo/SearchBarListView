//
//  ContentView.swift
//  SearchBarListView
//
//  Created by Võ Thanh Sang on 7/4/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var phones: Array = phoneData
    // 1
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            // 2
            VStack {
                // 3
                SearchBar(text: $searchText)
                // 4
                List(phones.filter { searchText.isEmpty ? true : $0.name.contains(searchText)}) { phone in
                    NavigationLink(destination: PhoneDetail(phone: phone)) {
                        PhoneCell(phone: phone)
                            .contextMenu {
                                Button(action: {
                                    self.setAsBought(item: phone)
                                }) {
                                    HStack {
                                        Text("Mark as bought")
                                        Image(systemName: "checkmark")
                                    }
                                }
                                
                                Button(action: {
                                    self.delete(item: phone)
                                }) {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                            }
                    }
                }
            }
            .navigationBarTitle("List iPhone")
        }
    }

private func setAsBought(item phone: Phone) {
    if let index = self.phones.firstIndex(where: { $0.id == phone.id }) {
        self.phones[index].didBuy.toggle()
    }
}

private func delete(item phone: Phone) {
    if let index = self.phones.firstIndex(where: { $0.id == phone.id }) {
        self.phones.remove(at: index)
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
