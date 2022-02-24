//
//  CharacterView.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct CharacterView: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text(character.name)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button("More"){
                    
                }
                .font(.callout)
            }
            .font(.title)
            KFImage(URL(string: character.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Gender: " + character.gender)
            Text("Status: " + character.status)
            if character.type.isEmpty == false {
                Text("Type: " + character.type)
            }
        }
        .padding()
    }
}

