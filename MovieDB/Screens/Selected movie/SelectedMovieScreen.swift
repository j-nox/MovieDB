import SwiftUI

struct SelectedMovieScreen: View {
  let video: Video
  let defaultUrl: String = "https://fikiwikiee.com/uploads/posts/2022-02/1645054777_3-fikiwiki-com-p-kartinki-ikonki-3.png"
  let imgUrl: URL
  
  init(video: Video) {
    self.video = video
    self.imgUrl = URL(string: video.poster.url)!
  }
  
  var body: some View {
    AsyncImage(url: imgUrl) { image in
      image.resizable()
    } placeholder: {
      Image("stubImage")
        .resizable()
        .scaledToFit()
        .frame(width: 190, height: 190)
    }
    .frame(width: 190, height: 190)
  }
}
