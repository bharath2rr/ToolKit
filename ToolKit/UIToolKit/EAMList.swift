//
//  EAMList.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 22/05/24.
//

import SwiftUI

struct EAMList<Item: Identifiable, Content: View>: View {
    var sections: [String: [Item]]
    var rowPadding: CGFloat = 0
    var rowSpacing: CGFloat = 0
    var rowSelection: Color? = nil
    var rowSeparatorVisibility: Visibility = .hidden
    var rowContent: (Item) -> Content
    var onSelect: ((Int, Int, Item) -> Void)?
    @State private var selectedIndexPath: IndexPath? = nil
    
    var body: some View {
        List {
            ForEach(Array(sections.keys.sorted()), id: \.self) { sectionTitle in
                if let items = sections[sectionTitle] {
                    SwiftUI.Section(header: sectionTitle.isEmpty ? nil : Text(sectionTitle).foregroundColor(.black).font(.system(size: 18)).padding(.bottom, 10).padding(.top, -15)) {
                        ForEach(items.indices, id: \.self) { itemIndex in
                            let item = items[itemIndex]
                            rowContent(item)
                                .padding(rowPadding)
                                .contentShape(Rectangle()) // Make the entire row tappable
                                .onTapGesture {
                                    selectedIndexPath = IndexPath(row: itemIndex, section: sections.keys.sorted().firstIndex(of: sectionTitle)!)
                                    onSelect?(sections.keys.sorted().firstIndex(of: sectionTitle)!, itemIndex, item)
                                }
                                .background(
                                    selectedIndexPath == IndexPath(row: itemIndex, section: sections.keys.sorted().firstIndex(of: sectionTitle)!) && rowSelection != nil ? rowSelection! : Color.clear
                                )
                        }
                    }
                  
                }
            }.listRowBackground(EAMTheme.eamColors.surface)
        }
        .padding(0)
        .listRowSpacing(rowSpacing)
        .listRowSeparator(rowSeparatorVisibility)
    }
}

