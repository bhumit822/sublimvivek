//
//  ContentView.swift
//  Sublime Return-details
//
//  Created by Vivek Chodvadiya on 2024-06-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let appClipURL = URL(string: "https://appclip.apple.com/id?p=com.narvar.sublime.Clip")!
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        Link("Test", destination: appClipURL)
    }
}

#Preview {
    ContentView()
}
