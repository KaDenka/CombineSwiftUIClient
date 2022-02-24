//
//  SectionHeaderView.swift
//  CombineSwiftUIClient
//
//  Created by Denis Kazarin on 24.02.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct SectionHeaderView: View {
    let header: String
    let lastUpdateTime: TimeInterval
    let currentDate: Date
    
    private var relativeTimeString: String {
        return RelativeDateTimeFormatter().localizedString(fromTimeInterval: lastUpdateTime - currentDate.timeIntervalSince1970)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
            Text("last update \(relativeTimeString)")
                .font(.subheadline)
        }
    }
    
}
