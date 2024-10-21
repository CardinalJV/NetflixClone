//
//  ImageLoader.swift
//  NetflixClone
//
//  Created by Jessy Viranaiken on 17/10/2024.
//

import SwiftUI

struct ImageLoader: View {
  
  let imageUrl: URL?
  let baseURL = "https://image.tmdb.org/t/p/w500/"
  
    var body: some View {
      if self.imageUrl != nil {
        AsyncImage(url: URL(string: self.baseURL + self.imageUrl!.relativeString)) { phase in
          switch phase {
            case .empty:
              ProgressView()
            case .success(let image):
              image
                .resizable()
            case .failure:
              VStack{
                Text("Erreur lors du chargement de l'image")
                Image(systemName: "xmark.circle")
              }
            @unknown default:
              EmptyView()
          }
        }
      } else {
        Image(systemName: "xmark")
      }
    }
}
