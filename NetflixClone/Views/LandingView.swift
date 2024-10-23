  //
  //  ContentView.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 16/10/2024.
  //

import SwiftUI
import TMDb

struct LandingView: View {
  
  let moviesController = MoviesController()
  let seriesController = SeriesController()
  let navigationController = NavigationController()
  
  @State var showSeriesView = false
  @State var showMoviesView = false
  @State var movie: Movie? = nil
  
  var body: some View {
    NavigationStack{
      ZStack{
        LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 44/255, green: 44/255, blue: 44/255)]),
                       startPoint: .bottom, endPoint: .top)
        .ignoresSafeArea()
          /* Main component */
          ScrollView{
            VStack{
              if self.navigationController.showFilterButton {
                FilterButton(moviesController: self.moviesController, navigationController: self.navigationController, showSeriesView: self.$showSeriesView, showMoviesView: self.$showMoviesView)
              }
              
               if self.showSeriesView {
                SeriesView(seriesController: self.seriesController)
              } else if self.showMoviesView {
                MoviesView(moviesController: self.moviesController, navigationController: self.navigationController)
              } else {
                VStack{
                  if !self.moviesController.moviesListsItems.isEmpty && self.movie != nil {
                    Poster(movie: self.movie)
                      .frame(width: 375)
                  }
                }
                .task{
                  if self.moviesController.moviesListsItems.isEmpty {
                    await self.moviesController.fetchMoviesListsItems(page: 1)
                    await self.moviesController.fetchMoviesListsItems(page: 2)
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
          .toolbar(self.navigationController.showToolbar ? .visible : .hidden)
          .toolbar{
            ToolbarItem(placement: .topBarLeading) {
              Text("For You")
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
        if self.navigationController.showPicker {
          /* Picker de catégories */
          ZStack{
            Color.black.opacity(0.95)
              .ignoresSafeArea(.all)
            ScrollView{
              VStack(spacing: 10){
                ForEach(self.moviesController.genres) { genre in
                  Button {
                    self.moviesController.selectedGenre = genre
                    self.navigationController.showPicker = false
                    self.navigationController.showToolbar = true
                  } label: {
                    Text(genre.name)
                      .foregroundStyle(.gray)
                      .bold()
                      .padding(10)
                    Spacer()
                  }
                }
              }
              .padding()
            }
          }
          .overlay(alignment: .bottom){
            Button {
              self.navigationController.showPicker = false
              self.navigationController.showToolbar = true
            } label: {
              Image(systemName: "xmark")
                .padding(15)
                .foregroundStyle(.black)
                .background(.white)
                .clipShape(.circle)
            }
          }
          /* - */
        }
      }
      .onAppear {
        self.navigationController.showToolbar = true
        self.navigationController.showFilterButton = true
      }
    }
  }
}

#Preview {
  LandingView()
}
