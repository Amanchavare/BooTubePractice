//
//  SeriesDetailView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct SeriesDetailView: View {
    let series: Series
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: series.poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(height: 400)
            
            Text(series.title)
                .font(.largeTitle)
                .bold()
            
            Text("Released: \(series.year)")
                .font(.subheadline)
                .padding(.top, 5)
            
            if let plot = series.plot, !plot.isEmpty {
                Text(plot)
                    .font(.body)
                    .padding(.top, 10)
                    .padding(.horizontal)
            }else {
                Text("No description available.")
                    .font(.body)
                    .padding(.top, 10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
