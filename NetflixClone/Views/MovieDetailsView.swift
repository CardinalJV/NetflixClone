//
//  MovieDetailsView.swift
//  NetflixClone
//
//  Created by Jessy Viranaiken on 21/10/2024.
//

import SwiftUI
import TMDb

struct MovieDetailsView: View {
  
  let movieController: MoviesController
  
  let movieListItem: MovieListItem
  @State var movie: Movie? = nil
  
    var body: some View {
      VStack{
        if self.movie != nil {
          Text(self.movie!.title)
        }
      }
      .task {
        self.movie = await self.movieController.fetchMovie(byId: self.movieListItem.id)
      }
    }
}

//#Preview {
//    MovieDetailsView()
//}
