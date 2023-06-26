//
//  AboutMeView.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import SwiftUI

struct AboutMeView: View {
    struct Constants {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        static let mapHeight = screenHeight * 0.3
        static let imageHeight = screenHeight * 0.35
        static let offset = -imageHeight/2
    }
    
    var body: some View {
        VStack {
            MyLocation()
                .frame(height: Constants.mapHeight)
            
            Image("myPhoto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: Constants.imageHeight)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .offset(y: Constants.offset)
        }
        
    }
}

struct AboutMeSection_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
