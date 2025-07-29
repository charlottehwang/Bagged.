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

struct PackingListView: View {
    @State private var items: [ChecklistItem] = [
        ChecklistItem(title: "Sunglasses", isChecked: false, sectionTitle: "Beach"),
        ChecklistItem(title: "Beach towel", isChecked: false, sectionTitle: "Beach"),
        ChecklistItem(title: "Shirts", isChecked: false, sectionTitle: "Clothes"),
        ChecklistItem(title: "Shorts", isChecked: false, sectionTitle: "Clothes"),
        ChecklistItem(title: "Toothbrush", isChecked: false, sectionTitle: "Toiletries"),
        ChecklistItem(title: "Toothpaste", isChecked: false, sectionTitle: "Toiletries")
    ]
    
    var groupedItems: [String: [ChecklistItem]] {
        Dictionary(grouping: items, by: { $0.sectionTitle })
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupedItems.keys.sorted(), id: \.self) { section in
                    Section(header: Text(section)) {
                        ForEach(groupedItems[section]!) { item in
                            HStack {
                                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                    .onTapGesture {
                                        toggleCheck(for: item)
                                    }
                                Text(item.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Checklist")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func toggleCheck(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
    }
    
    func addItem() {
        items.append(ChecklistItem(title: "New Item", isChecked: false, sectionTitle: "Misc"))
    }
}


#Preview {
    PackingListView()
}
