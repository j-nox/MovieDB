import Foundation

class MoviesViewModel: ObservableObject {
  @Published var movies: [Video]  = []
  @Published var serials: [Video] = []
  
  var rating: String  = "7-10"
  var year: String    = "2020-2022"
  var token: String   = "ZZAEZ9F-G304QYQ-NY3ZRDT-TBSNYBT"
  var baseURL: String = "https://api.kinopoisk.dev"
  
  init() {
    requestMovies()
    requestSerials()
  }
  
  func requestMovies() {
    
    guard let url = URL(string: "\(baseURL)/movie?field=rating.kp&search=\(rating)&field=year&search=\(year)&sortField=votes.kp&token=\(token)") else {
      fatalError("Missing URL")
    }
    
    let urlRequest = URLRequest(url: url)
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if let error = error {
        print("Request error: ", error)
        return
      }
      
      guard let response = response as? HTTPURLResponse else { return }
      
      if response.statusCode == 200 {
        
        guard let data = data else { return }
        
        DispatchQueue.main.async {
          
          do {
            let decodedMovies = try JSONDecoder().decode(VideoResponse.self, from: data)
            
            self.movies = decodedMovies.docs
          } catch let error {
            print("Error decoding: ", error)
          }
          
        }
      } else {
        print("error")
      }
    }
    
    dataTask.resume()
  }
  
  func requestSerials() {
    
    guard let url = URL(string: "\(baseURL)/movie?field=rating.kp&search=\(rating)&field=year&search=\(year)&field=typeNumber&search=2&sortField=year&sortType=1&sortField=votes.imdb&sortType=-1&token=\(token)") else {
      fatalError("Missing URL")
    }
    
    let urlRequest = URLRequest(url: url)
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if let error = error {
        print("Request error: ", error)
        return
      }
      
      guard let response = response as? HTTPURLResponse else { return }
      
      if response.statusCode == 200 {
        
        guard let data = data else { return }
        
        DispatchQueue.main.async {
          
          do {
            let decodedSerials = try JSONDecoder().decode(VideoResponse.self, from: data)
            
            self.serials = decodedSerials.docs
          } catch let error {
            print("Error decoding: ", error)
          }
          
        }
      } else {
        print("error")
      }
    }
    
    dataTask.resume()
  }

  
}
