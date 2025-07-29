//
//  PackingListView.swift
//  Bagged.
//
//  Created by Charlotte Hwang on 7/29/25.
//

import SwiftUI

struct PackingListView: View {
    var body: some View {
        //Text("This is the quiz view!")
    }
}

struct ChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool
}

import SwiftUI

struct PackingListView: View {
    @State private var items: [ChecklistItem] = [
        ChecklistItem(title: "Sunglasses", isChecked: false),
        ChecklistItem(title: "Sunscreen", isChecked: false),
        ChecklistItem(title: "Beach towel", isChecked: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: items[index].isChecked ? "checkmark.square.fill" : "square")
                            .onTapGesture {
                                items[index].isChecked.toggle()
                            }
                        Text(items[index].title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Packing List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func addItem() {
        items.append(ChecklistItem(title: "New Item", isChecked: false))
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

#Preview {
    PackingListView()
}
