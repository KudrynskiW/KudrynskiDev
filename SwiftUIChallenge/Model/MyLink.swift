//
//  MyLink.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import Foundation

struct MyLink: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var urlString: String
    
    func makeURL() -> URL {
        guard let url = URL(string: urlString) else {
            return URL(string: "")!
        }
        
        return url
    }
}
