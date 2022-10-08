import Foundation

struct MoviesResponse {
  var docs: [Movie]
}

struct Movie: Codable {
  let externalID: ExternalID
  let logo: Logo
  let poster: PosterResponse
  let rating: RatingResponse
  let votes: RatingResponse
  let id: Int
  let names: [Name]
  let alternativeName: String
  let welcomeDescription, enName: JSONNull?
  let movieLength: Int
  let name: String
  let shortDescription: JSONNull?
  let type: String
  let year: Int
  
  enum CodingKeys: String, CodingKey {
    case externalID = "externalId"
    case logo, poster, rating, votes, id, names, alternativeName
    case welcomeDescription = "description"
    case enName, movieLength, name, shortDescription, type, year
  }
}

struct ExternalID: Codable {
  let id: String
  let imdb: JSONNull?
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case imdb
  }
}

struct Logo: Codable {
  let id: String
  let url: JSONNull?
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case url
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
  let filmCritics, russianFilmCritics, await: Int
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case kp, imdb, filmCritics, russianFilmCritics, await
  }
}

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}
