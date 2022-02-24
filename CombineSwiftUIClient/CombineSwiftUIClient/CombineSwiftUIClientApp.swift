//
//  CombineSwiftUIClientApp.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//

import SwiftUI

@main
struct CombineSwiftUIClientApp: App {
    
    var body: some Scene {
        WindowGroup {
            CharactersView(viewModel: CharactersViewModel())
        }
    }
}
