//  ExtraView3.swift
//  Bagged.
//
//  Created by Charlotte Hwang on 7/29/25.
//

import SwiftUI

struct Extra3ChecklistItem: Identifiable {
    let id = UUID()
    var title3: String
    var isChecked3: Bool
    var sectionTitle3: String
}

let extra3PackingData: [String: [String]] = [
    "Essentials ✈️": [
        "Passpor & visa", "Wallet with euros", "Travel insurance info",
        "Reusable water bottle", "Snacks for the flight", "French phrasebook or translation app"
    ],
    "Clothing 👕": [
        "T-shirts / blouses", "Bottoms (jeans, slacks, skirts)", "Underwear", "Socks", "Pajamas", "Nice outfit for dinners or museums", "Swimsuit (pool, beach)", "Light sweater"
    ],
    "Toiletries 🧼": [
        "Toothbrush", "Toothpaste", "Hairbrush or comb", "Shampoo & conditioner", "Body Wash", "Deodorant", "Razor", "Moisturizer", "Bug spray", "Hair ties / clips"
    ],
    "Seasonal Stuff ☀️❄️": [
        "Sunglasses", "Sunhat", "Fan", "Gloves", "Wool hat", "Thermal layers", "Umbrella", "Layers", "Light raincoat"
    ],
    "Useful Extras 🎒": [
        "Day bag / backpack", "Reusable shopping bag", "Travel journal or book", "Travel laundry bag", "Earplugs & eyemask", "Compact umbrella"
    ],
    "Footwear 👟": [
        "Comfortable walking shoes", "Dress shoes or flats", "Sandals (summer)", "Waterproof shoes"
    ],
    "Electronics 📸": [
        "Phone & charger", "Power adapter (France uses Type C plug)", "Camera + SD cards", "Power bank", "Headphones"
    ]
]

struct ExtraView3: View {
    @State private var extra3Items: [Extra3ChecklistItem] = extra3PackingData.flatMap { section, titles in
        titles.map { title in
            Extra3ChecklistItem(title3: title, isChecked3: false, sectionTitle3: section)
        }
    }

    var groupedExtra3Items: [String: [Extra3ChecklistItem]] {
        Dictionary(grouping: extra3Items, by: { $0.sectionTitle3 })
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(groupedExtra3Items.keys.sorted(), id: \.self) { section in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(section)
                                .font(.headline)
                                .padding(.bottom, 5)
                            ForEach(groupedExtra3Items[section]!) { item in
                                HStack {
                                    Image(systemName: item.isChecked3 ? "checkmark.circle.fill" : "circle")
                                        .onTapGesture {
                                            toggleCheckExtra3(for: item)
                                        }
                                    Text(item.title3)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .navigationTitle("France Packing List")
            }
        }
    }

    func toggleCheckExtra3(for item: Extra3ChecklistItem) {
        if let index = extra3Items.firstIndex(where: { $0.id == item.id }) {
            extra3Items[index].isChecked3.toggle()
        }
    }
}

#Preview {
    ExtraView3()
}

