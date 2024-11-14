//
//  ContentView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieView()
                .tabItem {
                    Image(systemName: "film.fill")
                    Text("Movies")
                }

            SeriesView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Series")
                }

            LibraryView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Library")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .darkGray
        }
        .accentColor(.red) // Change tab color to red when selected
    }
}
