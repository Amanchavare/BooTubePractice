//
//  SeriesCategoryGridView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct SeriesCategoryGridView: View {
    let series: [Series]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(series) { serie in
                NavigationLink(destination: SeriesDetailView(series: serie)) {
                    VStack {
                        AsyncImage(url: URL(string: serie.poster)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 160, height: 240)
                        .cornerRadius(8)
                        
                        Text(serie.title)
                            .font(.caption)
                            .lineLimit(1)
                            .padding(.top, 5)
                    }
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
    }
}
