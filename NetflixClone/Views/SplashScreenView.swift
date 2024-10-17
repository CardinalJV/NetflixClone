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
  @State var showSeriesView = false
  @State var movie: Movie? = nil
  
  var body: some View {
    NavigationStack{
      ZStack{
        LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 44/255, green: 44/255, blue: 44/255)]),
                       startPoint: .bottom, endPoint: .top)
        .ignoresSafeArea()
        
        ScrollView{
          VStack{
            FilterButton(showSeriesView: self.$showSeriesView)
            if self.showSeriesView {
              SeriesView()
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
                  self.movie = await self.moviesController.fetchMovie(byId: moviesController.moviesListsItems.randomElement()!.id)!
                }
              }
            }
          }
          .padding()
        }
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
    }
  }
}

#Preview {
  SplashScreenView()
}
