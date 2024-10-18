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
    VStack{
      ScrollView{
        if !self.moviesController.moviesListsItems.isEmpty {
          LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)], spacing: 12.5){
            ForEach(self.moviesController.moviesListsItems) { movie in
              VStack{
                ImageLoader(imageUrl: movie.posterPath!)
                  .scaledToFit()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 112.5)
              }
              .clipShape(RoundedRectangle(cornerRadius: 5))
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
