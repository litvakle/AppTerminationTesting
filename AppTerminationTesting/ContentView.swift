//
//  ContentView.swift
//  AppTerminationTesting
//
//  Created by Lev Litvak on 04.04.2023.
//

import SwiftUI

struct ContentView: View {
    let loader: Loader
    
    var body: some View {
        VStack {
            Text("Testing the app termination")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification)) { _ in
            loader.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(loader: RealLoader())
    }
}
