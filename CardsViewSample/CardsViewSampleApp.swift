//
//  CardsViewSampleApp.swift
//  CardsViewSample
//
//  Created by Ilya on 04.11.20.
//

import SwiftUI

@main
struct CardsViewSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cards: Card.example)
        }
    }
}
