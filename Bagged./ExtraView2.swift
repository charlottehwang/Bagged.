//
//  ExtraView2.swift
//  Bagged.
//
//  Created by Charlotte Hwang on 7/29/25.
//

import SwiftUI

struct Extra2ChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool
    var sectionTitle: String
}

let extra2PackingData: [String: [String]] = [
    "Essentials ✈️": [
        "Travel documents", "Wallet", "Travel insurance info",
        "Reusable water bottle", "Snacks for the flight"
    ],
    "Clothing 👕": [
        "Short sleeve shirts", "Skirts / shorts", "Jeans / regular pants", "Underwear", "Socks", "Nice outfit (for dinners or temples)"
    ],
    "Toiletries 🧼": [
        "Toothbrush", "Toothpaste", "Hairbrush or comb", "Shampoo & conditioner", "Body Wash", "Deodorant", "Razor", "Moisturizer", "Bug spray", "Hair ties / clips"
    ],
    "Seasonal Stuff ❄️": [
        "Warm layers (sweaters, thermals - fall / winter)", "Coat (winter)", "Hat / gloves / scarf (winter)", "Swimsuit (hot springs, beach)", "Sunhat / sunglasses (summer)"
    ],
    "Useful Extras": [
        "Reusable water bottle", "Foldable tote/shopping bag", "Travel towel", "Laundry bag", "Travel pillow", "Japanese phrasebook or app", "Small gifts if staying with hosts"
    ],
    "Footwear 👟": [
        "Comfortable walking shoes", "Sandals / flip-flops", "Waterproofs shoes or boots for rainy season or snow"
    ],
    "Electronics 📸": [
        "Universal power adapter (Iceland uses Type F plug)", "Phone and charger", "Power bank", "Camera and SD Cards", "Waterproof phone case"
    ]
]

struct ExtraView2: View {
    @State private var extra2Items: [Extra2ChecklistItem] = extra2PackingData.flatMap { section, titles in
        titles.map { title in
            Extra2ChecklistItem(title: title, isChecked: false, sectionTitle: section)
        }
    }

    var groupedExtra2Items: [String: [Extra2ChecklistItem]] {
        Dictionary(grouping: extra2Items, by: { $0.sectionTitle })
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(groupedExtra2Items.keys.sorted(), id: \.self) { section in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(section)
                                .font(.headline)
                                .padding(.bottom, 5)
                            ForEach(groupedExtra2Items[section]!) { item in
                                HStack {
                                    Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                        .onTapGesture {
                                            toggleCheckExtra2(for: item)
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
                .navigationTitle("Japan Packing List")
            }
        }
    }

    func toggleCheckExtra2(for item: Extra2ChecklistItem) {
        if let index = extra2Items.firstIndex(where: { $0.id == item.id }) {
            extra2Items[index].isChecked.toggle()
        }
    }
}

#Preview {
    ExtraView2()
}
