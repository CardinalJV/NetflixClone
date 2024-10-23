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
  let navigationController: NavigationController
  
  let movieListItem: MovieListItem
  @State var movie: Movie? = nil
  @State var video: Video? = nil
  
  var body: some View {
    ZStack{
      VStack{
        if self.movie != nil {
          if self.video != nil {
            YouTubePlayer(videoID: self.video!.key)
              .frame(width: 400, height: 200)
              .overlay(alignment: .topTrailing){
                ZStack{
                  Button {
                    self.navigationController.showMovieDetailsView = false
                    self.navigationController.showFilterButton = true
                  } label: {
                    Image(systemName: "xmark")
                      .padding(5)
                      .foregroundStyle(.white)
                      .background(Color(.gray))
                      .clipShape(.circle)
                  }
                }
                .padding(5)
              }
          } else {
            EmptyView()
          }
          Text(self.movie!.title)
            .bold()
            .foregroundStyle(.white)
          
        }
        Spacer()
      }
      .background(.red)
      .task {
        self.movie = await self.movieController
          .fetchMovie(byId: self.movieListItem.id)
        self.video = await self.movieController.fetchMovieVideo(by: self.movie!.id)
      }
    }
  }
}

//  #Preview {
//      MovieDetailsView()
//  }
