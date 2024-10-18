  //
  //  ContentView.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 16/10/2024.
  //

import SwiftUI
import TMDb

struct SplashScreenView: View {
  
  let moviesController = MoviesController()
  let seriesController = SeriesController()
  @State var showSeriesView = false
  @State var showMoviesView = false
  @State var movie: Movie? = nil
  @State var showPicker = false
  
  var body: some View {
    NavigationStack{
      ZStack{
        LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 44/255, green: 44/255, blue: 44/255)]),
                       startPoint: .bottom, endPoint: .top)
        .ignoresSafeArea()
        if !self.showPicker {
          /* Main component */
          ScrollView{
            VStack{
              FilterButton(moviesController: self.moviesController, showSeriesView: self.$showSeriesView, showMoviesView: self.$showMoviesView, showPicker: self.$showPicker)
              if self.showSeriesView {
                SeriesView(seriesController: self.seriesController)
              } else if self.showMoviesView {
                MoviesView(moviesController: self.moviesController)
              } else {
                VStack{
                  if !self.moviesController.moviesListsItems.isEmpty && self.movie != nil {
                    Poster(movie: self.movie)
                      .frame(width: 375)
                  }
                }
                .task{
                  if self.moviesController.moviesListsItems.isEmpty {
                    await self.moviesController.fetchMoviesListsItems()
                    await self.moviesController.fetchMoviesGenres()
                    self.movie = await self.moviesController.fetchMovie(byId: moviesController.moviesListsItems.randomElement()!.id)!
                  }
                  if self.seriesController.tvSeriesListsItems.isEmpty {
                    await self.seriesController.fetchTVSeriesListsItems()
                  }
                }
              }
            }
            .padding()
          }
          .toolbar{
            ToolbarItem(placement: .topBarLeading) {
              Text("For Jessy")
                .bold()
                .font(.title2)
                .foregroundStyle(.white)
            }
            ToolbarItem {
              Image(systemName: "airplayvideo")
                .bold()
                .foregroundStyle(.white)
            }
            ToolbarItem {
              Image(systemName: "magnifyingglass")
                .bold()
                .foregroundStyle(.white)
            }
          }
          .toolbarBackground(Color(red: 40/255, green: 40/255, blue: 40/255).opacity(0.75), for: .navigationBar)
          /* - */
        } else {
          /* Picker de catégories */
          ScrollView{
            Color.gray.opacity(0.2)
              .ignoresSafeArea(.all)
            VStack{
              ForEach(self.moviesController.genres) { genre in
                Button {
                  self.moviesController.selectedGenre = genre
                } label: {
                  Text(genre.name)
                }
              }
            }
            .background(Color.black.opacity(0.4))
          /* - */
          }
        }
      }
    }
  }
}

#Preview {
  SplashScreenView()
}
