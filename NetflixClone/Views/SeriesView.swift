  //
  //  SeriesView.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 17/10/2024.
  //

import SwiftUI

struct SeriesView: View {
  
  let seriesController: SeriesController
  
  var body: some View {
    VStack{
      ScrollView{
        if !self.seriesController.tvSeriesListsItems.isEmpty {
          LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)], spacing: 12.5){
            ForEach(self.seriesController.tvSeriesListsItems) { tvSerie in
              VStack{
                ImageLoader(imageUrl: tvSerie.posterPath!)
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

//#Preview {
//  SeriesView()
//}
