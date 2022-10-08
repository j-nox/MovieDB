import Foundation

struct VideoResponse: Codable {
  var docs: [Video]
}

struct Video: Identifiable, Codable {
  let externalID: ExternalID
  let logo: Logo
  let poster: PosterResponse
  let rating: RatingResponse
  let votes: RatingResponse
  let id: Int
  let names: [Name]
  let alternativeName: String
  let movieLength: Int?
  let name: String
  let type: String
  let year: Int
  
  enum CodingKeys: String, CodingKey {
    case externalID = "externalId"
    case logo, poster, rating, votes, id, names, alternativeName
    case movieLength, name, type, year
  }
}

struct ExternalID: Codable {
  let id: String
  let imdb: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case imdb
  }
}

struct Logo: Codable {
  let id: String
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
  }
}

struct Name: Codable {
  let id, name: String
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case name
  }
}

struct PosterResponse: Codable {
  let id: String
  let url, previewURL: String
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case url
    case previewURL = "previewUrl"
  }
}

struct RatingResponse: Codable {
  let id: String
  let kp, imdb: Double
  let filmCritics: Int
  let russianFilmCritics: Double
  let await: Double
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case kp, imdb, filmCritics, russianFilmCritics, await
  }
}
