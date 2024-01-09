//
//  ContentView.swift
//  SampleStreamApp
//
//  Created by Russell Lowry on 1/9/24.
//

import SwiftUI

struct TabOneNavigationStack: View {
    var body: some View {
        NavigationStack {
            Text("Tab 1")
        }
    }
}

struct TabTwoNavigationStack: View {
    var body: some View {
        NavigationStack {
            Text("Tab 2")
        }
    }
}

struct TabThreeNavigationStack: View {
    var body: some View {
        NavigationStack {
            GroupChat()
        }
    }
}

struct TabFourNavigationStack: View {
    var body: some View {
        NavigationStack {
            Text("Tab 4")
        }
    }
}

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case tabOne
    case tabTwo
    case tabThree
    case tabFour
    
    var id: AppScreen { self }
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
            case .tabOne:
                Label {
                    Text("Tab 1")
                        .foregroundColor(.primary)
                } icon: {
                    Image("Tab1")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            case .tabTwo:
                Label {
                    Text("Tab 2")
                        .foregroundColor(.primary)
                } icon: {
                    Image("Tab2")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            case .tabThree:
                Label {
                    Text("Tab 3")
                        .foregroundColor(.primary)
                } icon: {
                    Image("Tab3")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            case .tabFour:
                Label {
                    Text("Tab 4")
                        .foregroundColor(.primary)
                } icon: {
                    Image("Tab4")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
        }
    }
}

struct AppTabView: View {
    @Binding var selection: AppScreen?
    
    var body: some View {
        TabView(selection: $selection) {
            TabOneNavigationStack()
                .tag(AppScreen.tabOne)
                .tabItem { AppScreen.tabOne.label }
            
            TabTwoNavigationStack()
                .tag(AppScreen.tabTwo)
                .tabItem { AppScreen.tabTwo.label }
            
            TabThreeNavigationStack()
                .tag(AppScreen.tabThree)
                .tabItem { AppScreen.tabThree.label }
            
            TabFourNavigationStack()
                .tag(AppScreen.tabFour)
                .tabItem { AppScreen.tabFour.label }
        }
    }
}

struct ContentView: View {
    
    @State private var selection: AppScreen? = .tabOne
    
    var body: some View {
        AppTabView(selection: $selection)
    }
}

#Preview {
    ContentView()
}
