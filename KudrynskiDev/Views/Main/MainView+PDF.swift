//
//  MainView+PDF.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 26/06/2023.
//

import SwiftUI

struct MainViewPDF: View {
    @Binding var coverView: Bool
    
    var body: some View {
        ZStack {
            PDFKitView(url: Bundle.main.url(forResource: "CV.pdf", withExtension: nil)!).opacity(coverView ? 0.25 : 1.0)
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    ShareLink(item: Bundle.main.url(forResource: "CV.pdf", withExtension: nil)!) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .foregroundColor(.blue)
                            .padding()
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.blue, lineWidth: 2)
                            }
                            .shadow(radius: 5)
                    }
                }
            }.padding()
        }.background(Color.black)
    }
}

struct MainViewPDFPreviews: PreviewProvider {
    static var previews: some View {
        MainViewPDF(coverView: .constant(false))
    }
}
