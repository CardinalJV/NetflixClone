  //
  //  MoviesView.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 18/10/2024.
  //

import SwiftUI

struct MoviesView: View {
  
  let moviesController: MoviesController
  
  var body: some View {
    NavigationStack{
      VStack{
        ScrollView{
          if !self.moviesController.moviesListsItems.isEmpty {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)], spacing: 12.5){
              ForEach(self.moviesController.selectedGenre != nil ? moviesController.sortByGenre()! : moviesController.moviesListsItems) { movieListItem in
                  NavigationLink {
                    MovieDetailsView(movieController: self.moviesController, movieListItem: movieListItem)
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
    }
  }
  //
  //#Preview {
  //    MoviesView()
  //}
