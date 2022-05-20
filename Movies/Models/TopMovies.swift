

import Foundation

// MARK: - TopMovies
struct TopMovies: Codable {
    let items: [TopMovie]?
    let errorMessage: String?
}

// MARK: - Item
struct TopMovie: Codable {
    let id, rank, title, fullTitle: String?
    let year: String?
    let image: String?
    let crew, imDBRating, imDBRatingCount: String?

    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
