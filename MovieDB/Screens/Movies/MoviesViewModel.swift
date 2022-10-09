import Foundation

class MoviesViewModel: ObservableObject {

  @Published var movies: [Video]  = []
  @Published var serials: [Video] = []
  
  var rating: String  = "7-10"
  var year: String    = "2020-2022"
  var token: String   = "ZZAEZ9F-G304QYQ-NY3ZRDT-TBSNYBT"
  var baseURL: String = "https://api.kinopoisk.dev"
  
  init() {
    
    Task {
      
      guard let moviesURL = URL(string: "\(baseURL)/movie?field=rating.kp&search=\(rating)&field=year&search=\(year)&sortField=votes.kp&token=\(token)") else {
        throw AppError.custom(errorDescription: "Wrong URL")
      }
      
      guard let serialURL = URL(string: "\(baseURL)/movie?field=rating.kp&search=\(rating)&field=year&search=\(year)&field=typeNumber&search=2&sortField=year&sortType=1&sortField=votes.imdb&sortType=-1&token=\(token)") else {
        fatalError("Missing URL")
      }
      
      let moviesResource: Resource  = Resource<VideoResponse>(url: moviesURL, httpMethod: .get)
      
      let serialsResource: Resource = Resource<VideoResponse>(url: serialURL, httpMethod: .get)
      
      do {

        let moviesResponse: VideoResponse   = try await NetworkService.shared.request(resource: moviesResource)
        
        let serialsResponse: VideoResponse  = try await NetworkService.shared.request(resource: serialsResource)
        
        DispatchQueue.main.async {
          self.movies   = moviesResponse.docs
          self.serials  = serialsResponse.docs
        }
        
      } catch {
        throw AppError.custom(errorDescription: "Some Error")
      }
    }
  }
}
