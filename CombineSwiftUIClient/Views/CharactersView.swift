//
//  CharactersView.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct CharactersView: View {
    var model: CharactersViewModel
    var filterSettingsIsPresented: Bool = false
    var currentDate: Date = Date()
    
    private let filter: String = "All characters"
    
    init(model: CharactersViewModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeaderView(header: filter, lastUpdateTime: model.lastUpdateTime, currentDate: self.currentDate)) {
                    ForEach(self.model.characters) { character in
                        CharacterView(character: character)
                    }
                }
                .padding(2)
            }
            .navigationBarTitle(Text("Characters"))
            .navigationBarItems(trailing:
                                    Button("Filter") {
                
            }
                                    .foregroundColor(.blue)
            )
        }
    }
}
