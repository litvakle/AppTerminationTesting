//
//  AppTerminationTestingApp.swift
//  AppTerminationTesting
//
//  Created by Lev Litvak on 04.04.2023.
//

import SwiftUI

@main
struct AppTerminationTestingApp: App {
    let loader = RealLoader()
    
    var body: some Scene {
        WindowGroup {
            ContentView(loader: loader)
        }
    }
}

protocol Loader {
    func load()
}

class RealLoader: Loader {
    func load() {
        print("Real loading")
    }
}
