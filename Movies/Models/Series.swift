

import Foundation

// MARK: - Series
struct Sereis: Codable {
    let items: [TvSeries]?
    let errorMessage: String?
}

// MARK: - Tv
struct TvSeries: Codable {
    let id, rank, rankUpDown, title: String?
    let fullTitle, year: String?
    let image: String?
    let crew, imDBRating, imDBRatingCount: String?

    enum CodingKeys: String, CodingKey {
        case id, rank, rankUpDown, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}

