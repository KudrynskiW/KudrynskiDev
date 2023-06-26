//
//  AboutMeView+MyLocation.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import SwiftUI
import MapKit

struct MyLocation: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.107652651570575, longitude: 17.033403530115393), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .disabled(true)
    }
}

struct MyLocation_Previews: PreviewProvider {
    static var previews: some View {
        MyLocation()
    }
}
