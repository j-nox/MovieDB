import SwiftUI

struct SelectedMovieScreen: View {
  let video: Video
  let defaultUrl: String = "https://fikiwiki.com/uploads/posts/2022-02/1645054777_3-fikiwiki-com-p-kartinki-ikonki-3.png"
  let imgUrl: URL
  
  init(video: Video) {
    self.video = video
    self.imgUrl = URL(string: video.poster.url) ?? URL(string: defaultUrl)!
  }
  
  var body: some View {
    AsyncImage(url: imgUrl)
  }
}
