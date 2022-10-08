import SwiftUI

struct MoviesScreen: View {
  @StateObject var viewModel: MoviesViewModel = MoviesViewModel()
  
  var body: some View {
    ScrollView {
      ForEach(viewModel.serials) { movie in
        HStack {
          Text(movie.name)
            .font(.largeTitle)
          
          Spacer()
        }
         .padding()
      }
    }
  }
}
