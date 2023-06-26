//
//  MainView.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import SwiftUI
import UIKit

struct MainView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var selectedTab = 2
    @State private var colorSchemeSelected: ColorScheme = .light
    @State private var showLightBackgroundAlert: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainViewPDF(coverView: $showLightBackgroundAlert)
                .onAppear(perform: {
                    if colorScheme == .dark {
                        showLightBackgroundAlert.toggle()
                    }
                })
                .tabItem {
                    Label("CV", systemImage: "doc.fill")
                }
                .tag(1)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.secondary.opacity(0.1), for: .tabBar)
                
            
            MainViewMe()
                .tabItem {
                    Label("Me", systemImage: "person.fill")
                }
                .tag(2)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.secondary.opacity(0.1), for: .tabBar)
            
            MainViewSettings(colorScheme: $colorSchemeSelected)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.secondary.opacity(0.1), for: .tabBar)
        }
        .preferredColorScheme(colorSchemeSelected)
        .onAppear {
            colorSchemeSelected = colorScheme == .dark ? .dark : .light
        }
        .alert("Do you want to open this view?", isPresented: $showLightBackgroundAlert, actions: {
            Button("Show", role: .cancel) { }
            Button("Go back", role: .destructive) { selectedTab = 2 }
        }, message: {
            Text("Currently your appearance setting is set to Dark Mode, CV document have white background, so you can be seriously hurted by unexpected change of brightness, do you still want to show this document?")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
