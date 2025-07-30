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

let packingData: [String: [String]] = [
    "Essentials ✈️": [
        "Travel documents", "Wallet", "Phone + charger", "Travel insurance info",
        "Reusable water bottle", "Snacks for the flight", "Sunglasses",
        "Sunscreen (reef-safe)", "Lip balm with SPF"
    ],
    "Clothing 👕": [
        "Swimsuits", "Tank tops / t-shirts", "Shorts", "Pajamas", "Flip-flops or sandals", "Sneakers","Underwear", "Socks", "Light sweater or jacket", "Hat or visor"
    ],
    "Toiletries 🧼": [
        "Toothbrush", "Toothpaste", "Hairbrush or comb", "Shampoo & conditioner", "Body Wash","Deodorant", "Razor", "Moisturizer", "Bug spray", "Hair ties / clips"
    ],
    "Beach 🏖️": [
        "Beach towel or quick-dry towel", "Waterproof phone pouch", "Snorkel gear",
        "Dry bag", "Beach bag or tote"
    ],
    "Excursions 🥾": [
        "Hiking shoes or sturdy sneakers", "Reusable daypack", "Water shoes",
        "GoPro or waterproof camera"
    ],
    "Nice to Have 📚": [
        "Book or Kindle", "Travel journal", "Portable charger",
        "Lightweight blanket or scarf", "Collapsible tote for souvenirs"
    ]
]


struct PackingListView: View {
    

    @State private var items: [ChecklistItem] = packingData.flatMap { section, titles in
        titles.map { title in
            ChecklistItem(title: title, isChecked: false, sectionTitle: section)
        }
    }

    var groupedItems: [String: [ChecklistItem]] {
        Dictionary(grouping: items, by: { $0.sectionTitle })
    }
    
    var body: some View {
       
            NavigationStack {
                ZStack {
                    
                ScrollView{
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(groupedItems.keys.sorted(), id: \.self) { section in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(section)
                                    .font(.headline)
                                    .padding(.bottom, 5)
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
                            
                            .padding(.horizontal)
                        }
                        Spacer() // Fills remaining space
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .navigationTitle("Packing List")
                    
                }
            }
        }
    }

    func toggleCheck(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
    }
}

#Preview {
    PackingListView()
}

