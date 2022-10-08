import SwiftUI

struct SelectedMovieScreen: View {
  let video: Video
  
  var body: some View {
    Text(video.name)
  }
}
