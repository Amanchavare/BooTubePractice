//
//  SeriesCarouselView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct SeriesCarouselView: View {
    let series: [Series]
    
    var body: some View {
        TabView {
            ForEach(series) { serie in
                AsyncImage(url: URL(string: serie.poster)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 250)
                .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 250)
        .padding(.bottom, 20)
    }
}
