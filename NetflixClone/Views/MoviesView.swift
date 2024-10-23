  //
  //  MoviesView.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 18/10/2024.
  //

import SwiftUI
import TMDb

struct MoviesView: View {
  
  let moviesController: MoviesController
  let navigationController: NavigationController
  
  @State private var selectedMovie: MovieListItem? = nil
  @State var movie: Movie? = nil
  
  var body: some View {
    NavigationStack{
      VStack{
        if self.navigationController.showMovieDetailsView {
          MovieDetailsView(movieController: self.moviesController, navigationController: self.navigationController, movieListItem: self.selectedMovie!)
            .transition(.scale)
            .onDisappear{
              self.selectedMovie = nil
              self.navigationController.showToolbar = true
            }
        } else {
          ScrollView{
            if !self.moviesController.moviesListsItems.isEmpty {
              LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)], spacing: 12.5){
                ForEach(self.moviesController.selectedGenre != nil ? moviesController.sortByGenre()! : moviesController.moviesListsItems) { movieListItem in
                  Button {
                    self.selectedMovie = movieListItem
                    self.navigationController.showToolbar = false
                    self.navigationController.showFilterButton = false
                    self.navigationController.showMovieDetailsView = true
                  } label: {
                    ImageLoader(imageUrl: movieListItem.posterPath!)
                      .scaledToFit()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 112.5)
                  }
                }
              }
            }
          }
        }
      }
      .animation(.smooth(duration: 0.5), value: self.navigationController.showMovieDetailsView)
    }
  }
}
  //
  //#Preview {
  //    MoviesView()
  //}
