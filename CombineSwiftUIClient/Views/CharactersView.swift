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
    @ObservedObject var viewModel: CharactersViewModel
    @State private var filterSettingsIsPresented: Bool = false
    var currentDate: Date = Date()
    
    private let filter: String = "All characters"
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeaderView(header: filter, lastUpdateTime: viewModel.lastUpdateTime, currentDate: self.currentDate)) {
                    ForEach(self.viewModel.characters) { character in
                        CharacterView(character: character)
                    }
                }
                .padding(2)
            }
            .onAppear(perform: {
                viewModel.fetchCharacters()
            })
            .sheet(isPresented: $filterSettingsIsPresented, content: {
                FilterSettingsView()
            })
            .alert(item: $viewModel.error, content: { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .cancel())
            })
            .navigationBarTitle(Text("Characters"))
            .navigationBarItems(trailing:
                                    Button("Filter") {
                filterSettingsIsPresented.toggle()
                
            }
                                    .foregroundColor(.blue)
            )
        }
    }
}
