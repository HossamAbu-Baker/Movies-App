
import Foundation


// MARK: - PopulerMovies
struct Populer: Codable {
    let items: [popMovie]?
    let errorMessage: String?
}

// MARK: - popMovie
struct popMovie: Codable {
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
