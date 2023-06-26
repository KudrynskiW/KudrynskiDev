//
//  LinksView.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import SwiftUI

struct LinksView: View {
    struct Constants {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        static let linksViewFrame = screenHeight * 0.15
        static let linksViewHorizontalPadding = -16.0
    }
    
    var myLinks: [MyLink] = try! load("links.json")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Links")
                .font(.title2)
            
            List(myLinks) { myLink in
                HStack {
                    Text(myLink.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()

                    Link("Open", destination: myLink.makeURL())
                }
            }
            .listStyle(.inset)
            .padding(.horizontal, Constants.linksViewHorizontalPadding)
            .frame(height: Constants.linksViewFrame)
        }
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}
