//
//  DataLoader.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import Foundation

enum DataLoaderError: String, Error {
    case noSkills = "No skills, sadly"
    case parsingSkills = "Well, something went wrong, i guess parsing isn't working as it should be :)"
    case decoderError = "Eh, decoder is faulty, we need to buy new one :/"
}

func load<T: Decodable>(_ filename: String) throws -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        throw DataLoaderError.noSkills
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        throw DataLoaderError.parsingSkills
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw DataLoaderError.decoderError
    }
}
