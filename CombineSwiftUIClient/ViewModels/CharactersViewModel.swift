//
//  CharactersViewModel.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    
   @Published private var allCharacters: [Character] = []
   @Published var error: APIClient.Error?
   @Published var lastUpdateTime: TimeInterval = Date().timeIntervalSince1970
    
    private var apiClient = APIClient()
    private var currentPage: Int = 0
    private var cancellables = Set<AnyCancellable>()
    
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
    
    func fetchCharacters() {
        apiClient.page(num: currentPage + 1)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.error = error
                }
            } receiveValue: { [weak self] page in
                guard let self = self else { return }
                self.lastUpdateTime = Date().timeIntervalSince1970
                self.error = nil
                self.currentPage += 1
                self.allCharacters.append(contentsOf: page.results)
            }
            .store(in: &cancellables)

    }
}
