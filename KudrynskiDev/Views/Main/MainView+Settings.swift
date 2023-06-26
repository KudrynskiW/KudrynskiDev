//
//  MainView+Settings.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 26/06/2023.
//

import SwiftUI

struct MainViewSettings: View {
    @Binding var colorScheme: ColorScheme
    @State private var selectedAppearance = UIUserInterfaceStyle.unspecified
    
    var body: some View {
        VStack {
            List {
                Picker("Appearance", selection: $selectedAppearance) {
                    Text("Light Mode").tag(UIUserInterfaceStyle.light)
                    Text("Dark Mode").tag(UIUserInterfaceStyle.dark)
                }
            }.onChange(of: selectedAppearance) { newValue in
                switch newValue {
                case .light:
                    colorScheme = .light
                case .dark:
                    colorScheme = .dark
                default:
                    fatalError()
                }
            }
        }.onAppear {
            selectedAppearance = colorScheme == .dark ? .dark : .light
        }
    }
}

struct MainViewSettings_Previews: PreviewProvider {
    static var previews: some View {
        MainViewSettings(colorScheme: .constant(.light))
    }
}
