//
//  MoviesController.swift
//  NetflixClone
//
//  Created by Jessy Viranaiken on 16/10/2024.
//

import TMDb
import Foundation

@Observable
class MoviesController {
  
  var moviesListsItems: [MovieListItem] = []
  var genres: [Genre] = []
  var selectedGenre: Genre? = nil
  let tmdbClient = TMDbClient(apiKey: "b5d8017e240d54c376f083183218e549")
  
  func fetchMoviesListsItems() async {
    do {
      self.moviesListsItems = try await tmdbClient.discover.movies().results
      print(self.moviesListsItems.count)
    } catch {
      print(error)
    }
  }
  
  func fetchMovie(byId id: Int) async -> Movie? {
    do {
      let movie = try await self.tmdbClient.movies.details(forMovie: id, language: "fr")
      return movie
    } catch{
      print(error)
      return nil
    }
  }
  
  func fetchMoviesGenres() async {
    do {
      self.genres = try await tmdbClient.genres.movieGenres(language: "fr")
    } catch {
      print(error)
    }
  }
}
