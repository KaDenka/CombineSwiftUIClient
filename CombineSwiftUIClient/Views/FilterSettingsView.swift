//
//  FilterSettingsView.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//


import SwiftUI

struct FilterSettingsView: View {
    
    @State var tags: [Tag] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Tag.allCases) { tag in
                    Button(action: {
                        self.changeTagState(tag)
                    }, label: {
                        HStack {
                            if self.tags.contains(tag) {
                                Image(systemName: "checkmark.circle.fill")
                            }
                            Text(tag.rawValue.capitalized)
                        }
                    })
                }
            }
            .navigationBarTitle(Text("Tags"))
            .navigationBarItems(trailing:
                                    Button("Done"){
                
            }
            )
        }
    }
    
    func changeTagState(_ tag: Tag) {
        tags.contains(tag)
        ? tags.removeAll(where: { $0 == tag})
        : tags.append(tag)
    }
}
