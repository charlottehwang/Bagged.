//
//  ExtraView1.swift
//  Bagged.
//
//  Created by Charlotte Hwang on 7/29/25.
//

import SwiftUI

struct ExtraChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool
    var sectionTitle: String
}

let extraPackingData: [String: [String]] = [
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

struct ExtraView1: View {
    @State private var extraItems: [ExtraChecklistItem] = extraPackingData.flatMap { section, titles in
        titles.map { title in
            ExtraChecklistItem(title: title, isChecked: false, sectionTitle: section)
        }
    }

    var groupedExtraItems: [String: [ExtraChecklistItem]] {
        Dictionary(grouping: extraItems, by: { $0.sectionTitle })
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(groupedExtraItems.keys.sorted(), id: \.self) { section in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(section)
                                .font(.headline)
                                .padding(.bottom, 5)
                            ForEach(groupedExtraItems[section]!) { item in
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
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .navigationTitle("Extra Checklist")
            }
        }
    }

    func toggleCheck(for item: ExtraChecklistItem) {
        if let index = extraItems.firstIndex(where: { $0.id == item.id }) {
            extraItems[index].isChecked.toggle()
        }
    }
}

#Preview {
    ExtraView1()
}
