//
//  SeriesView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUICore
import SwiftUI

struct SeriesView: View {
    @StateObject private var seriesViewModel = SeriesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Horror Series")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 16)
                    
                    SeriesCarouselView(series: seriesViewModel.series)
                    
                    Text("New Releases")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 16)
                    
                    SeriesCategoryGridView(series: seriesViewModel.series)
                }
                .background(Color.black.ignoresSafeArea())
            }
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)
            .foregroundColor(.white)
        }
        .navigationBarHidden(true)
    }
}
