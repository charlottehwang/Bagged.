//
//  PackingListView.swift
//  Bagged.
//
//  Created by Charlotte Hwang on 7/29/25.
//

import SwiftUI


struct ChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool
    var sectionTitle: String
}

import SwiftUI

struct PackingListView: View {
    @State private var items: [ChecklistItem] = [
        ChecklistItem(title: "Sunglasses", isChecked: false, sectionTitle: "Beach"),
        ChecklistItem(title: "Sunscreen", isChecked: false, sectionTitle: "Beach"),
        ChecklistItem(title: "Beach towel", isChecked: false, sectionTitle: "Beach"),
        ChecklistItem(title: "Water bottle", isChecked: false, sectionTitle: "Beach")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: items[index].isChecked ? "checkmark.square.fill" : "circle")
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
