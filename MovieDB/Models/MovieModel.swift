//import Foundation
//
//struct MovieModel: Identifiable, Codable {
//  let poster: Poster
//  let rating: Rating
//  let id: Int
//  let movieLength: Int
//  let name: String
//  let shortDescription: String?
//  let year: Int
//}
//
//struct Poster: Codable {
//  let id: String
//  let url, previewURL: String
//
//  enum CodingKeys: String, CodingKey {
//    case id = "_id"
//    case url
//    case previewURL = "previewUrl"
//  }
//}
//
//struct Rating: Codable {
//  let id: String
//  let kp, imdb: Double
//  let filmCritics, russianFilmCritics, await: Int
//
//  enum CodingKeys: String, CodingKey {
//    case id = "_id"
//    case kp, imdb, filmCritics, russianFilmCritics, await
//  }
//}
