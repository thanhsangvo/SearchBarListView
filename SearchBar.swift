//
//  SearchBar.swift
//  SearchBarListView
//
//  Created by Võ Thanh Sang on 7/4/20.
//

import SwiftUI

struct SearchBar: View {
    // 1
        @Binding var text: String
        // 2
        @State private var isEditing = false

        var body: some View {
            HStack {
                // 3
                TextField("Search ...", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "􀊫")
                                .foregroundColor(Color(.gray))
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(Color(.gray))
                                        .padding(.trailing, 8)
                                })
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                // 4
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
