//
//  ContentView.swift
//  SwipeCards
//
//  Created by Pooja on 21/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView {
            
            Text("Home Screen")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Search Screen")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            Text("Home Screen")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Search Screen")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .tabViewStyle(.tabBarOnly)
        .padding()
    }
}

#Preview {
    ContentView()
}
