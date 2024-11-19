import Foundation

class SeriesViewModel: ObservableObject {
    @Published var series: [Series] = []
    private let imdbSeriesService = IMDbService()  // Assuming you have a separate service for Series
    
    init() {
        fetchHorrorSeries()
    }
    
    func fetchHorrorSeries() {
            imdbSeriesService.fetchHorrorSeries { [weak self] series in
                if let series = series {
                    self?.series = series
                    
                    // Fetch full details for each series to get the plot
                    for (index, seriesItem) in series.enumerated() {
                        self?.imdbSeriesService.fetchSeriesDetails(imdbID: seriesItem.id) { detailedSeries in
                            if let detailedSeries = detailedSeries {
                                DispatchQueue.main.async {
                                    self?.series[index] = detailedSeries
                                }
                            }
                        }
                    }
                }
            }
        }
}

