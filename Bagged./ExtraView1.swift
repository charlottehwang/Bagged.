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
        "Travel documents", "Wallet", "Travel insurance info",
        "Reusable water bottle", "Snacks for the flight"
    ],
    "Clothing 👕": [
        "Long sleeve shirts", "Short sleeve shirts", "Thermal top & bottom", "Hiking pants", "Jeans / regular pants", "Wool socks"
    ],
    "Toiletries 🧼": [
        "Toothbrush", "Toothpaste", "Hairbrush or comb", "Shampoo & conditioner", "Body Wash","Deodorant", "Razor", "Moisturizer", "Bug spray", "Hair ties / clips"
    ],
    "Outerwear 🧥": [
        "Waterproof and windproof jacket", "Lightweight insulated jacket", "Waterproof rain pants", "Beanie or wool hat", "Waterproof and insulated gloves"
    ],
    "Adventure gear 🌋": [
        "Daypack", "Reusable water bottle", "Swimsuit", "Extra bag for wet clothes", "Flashlight", "Headlamp", "Binoculars", "Protein bars & snacks"
    ],
    "Footwear 🥾": [
        "Waterproof hiking boots", "Casual shoes / sneakers for city", "Sandals for hot springs / hotel"
    ],
    "Electronics 🔌": [
        "Universal power adapter (Iceland uses Type F plug)", "Phone and charger", "Power bank", "Camera and SD Cards", "Waterproof phoen case (if visitng waterfalls or hot springs)"
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
                .navigationTitle("Iceland Packing List")
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
