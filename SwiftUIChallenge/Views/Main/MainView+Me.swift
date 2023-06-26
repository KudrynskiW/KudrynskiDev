//
//  MainViewMe.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 22/06/2023.
//

import SwiftUI

struct MainViewMe: View {
    struct Constants {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        static let abutMePadding = screenHeight * 0.27
    }
    
    var body: some View {
        VStack {
            AboutMeView()
                .padding(.bottom, -Constants.abutMePadding)
            
            VStack(alignment: .leading) {
                SkillsView()
                
                Divider().padding(.vertical, 8)
                
                LinksView()
                
            }.padding()
            
            Spacer()
        }.ignoresSafeArea(edges: .top)
            
    }
}


struct MainViewMe_Previews: PreviewProvider {
    static var previews: some View {
        MainViewMe()
    }
}
