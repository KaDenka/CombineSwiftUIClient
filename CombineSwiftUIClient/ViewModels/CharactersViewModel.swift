//
//  CharactersViewModel.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//

import Foundation

class CharactersViewModel {
    private var allCharacters: [Character] = []
    var error: APIClient.Error?
    var lastUpdateTime: TimeInterval = Date().timeIntervalSince1970
    
    private var apiClient = APIClient()
    private var currentPage: Int = 1
    
    var filterTags: [Tag] = []
    var characters: [Character] {
        guard !filterTags.isEmpty else { return allCharacters }
        
        return allCharacters
            .filter { (character) -> Bool in
                return filterTags.reduce(false) { (isMatch, tag) -> Bool in
                    self.checkMatching(character: character, for: tag)
                }
            }
    }
    
    private func checkMatching(character: Character, for tag: Tag) -> Bool {
        switch tag {
        case .alive, .dead:
            return character.status.lowercased() == tag.rawValue.lowercased()
        case .female, .male, .genderless:
            return character.gender.lowercased() == tag.rawValue.lowercased()
        }
    }
}
