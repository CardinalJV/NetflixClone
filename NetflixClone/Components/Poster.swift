  //
  //  ImageLoader.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 16/10/2024.
  //

import SwiftUI
import TMDb

struct Poster: View {
  
  var movie: Movie? = nil
  
  var body: some View {
    VStack(spacing: 0){
      if self.movie != nil {
        ImageLoader(imageUrl: self.movie!.posterPath!)
          .scaledToFit()
          .overlay(alignment: .topLeading){
            if self.movie!.productionCompanies!.contains(where: {$0.name == "Netflix"}) {
              Image("AppImage")
                .resizable()
                .frame(width: 25, height: 25)
            }
          }
      }
      HStack{
        Button {
          print("play")
        } label: {
          Image(systemName: "play.fill")
          Text("Play")
        }
        .padding(10)
        .frame(width: 170, height: 40)
        .background(.white)
        .bold()
        .foregroundStyle(.black)
        .clipShape(.rect(cornerRadius: 5))
        Spacer()
        Button {
          print("list")
        } label: {
          Image(systemName: "plus")
          Text("My List")
        }
        .padding(10)
        .frame(width: 170, height: 40)
        .foregroundStyle(.white)
        .bold()
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
        .clipShape(.rect(cornerRadius: 5))
        .shadow(color: .white.opacity(0.5), radius: 10, x: 0, y: 0)
      }
      .padding()
      .frame(width: 375, height: 65)
      .background(.black)
    }
    .clipShape(.rect(cornerRadius: 10))
  }
}

#Preview {
  LandingView()
}
