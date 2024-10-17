//
//  SeriesController.swift
//  NetflixClone
//
//  Created by Jessy Viranaiken on 17/10/2024.
//

import TMDb
import Foundation

@Observable
class SeriesController {
  
  var tvSeriesListsItems: [TVSeriesListItem] = []
  let tmdbClient = TMDbClient(apiKey: "b5d8017e240d54c376f083183218e549")
  
  func fetchTVSeriesListsItems() async {
    do {
      self.tvSeriesListsItems = try await tmdbClient.discover.tvSeries().results
      print(self.tvSeriesListsItems.count)
    } catch {
      print(error)
    }
  }
  
  func fetchTVSeries(byId id: Int) async -> TVSeries? {
    do {
      let tvSeries = try await self.tmdbClient.tvSeries.details(forTVSeries: id, language: "fr")
      return tvSeries
    } catch{
      print(error)
      return nil
    }
  }
}
