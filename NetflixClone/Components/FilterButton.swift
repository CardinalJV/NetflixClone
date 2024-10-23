  //
  //  FilterButton.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 17/10/2024.
  //

import SwiftUI

struct FilterButton: View {
  
  let moviesController: MoviesController
  let navigationController: NavigationController
  
  @Binding var showSeriesView: Bool
  @Binding var showMoviesView: Bool
  
  var body: some View {
    HStack{
      /* Back button */
      if self.showSeriesView || self.showMoviesView {
        Button {
          self.showSeriesView = false
          self.showMoviesView = false
          self.moviesController.selectedGenre = nil
        } label: {
          Image(systemName: "xmark")
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(7)
            .background(
              RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 1)
            )
        }
        .transition(.asymmetric(insertion: .slide, removal: .scale))
      }
      /* - */
      /* Series button */
      if !self.showMoviesView {
        Button {
          if self.showSeriesView {
            self.showSeriesView = false
            self.moviesController.selectedGenre = nil
          } else {
            self.showSeriesView = true
          }
        } label: {
          Text("Series")
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(
              ZStack {
                RoundedRectangle(cornerRadius: 25)
                  .fill(self.showSeriesView ? Color.white.opacity(0.2) : Color.clear)
                RoundedRectangle(cornerRadius: 25)
                  .stroke(Color.gray, lineWidth: 1)
              }
            )
        }
        .transition(.asymmetric(insertion: .slide, removal: .scale))
      }
      /* - */
      /* Movies button */
      if !self.showSeriesView {
        Button {
          if self.showMoviesView {
            self.showMoviesView = false
            self.moviesController.selectedGenre = nil
          } else {
            self.showMoviesView = true
          }
        } label: {
          Text("Films")
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(
              ZStack {
                RoundedRectangle(cornerRadius: 25)
                  .fill(self.showMoviesView ? Color.white.opacity(0.2) : Color.clear)
                RoundedRectangle(cornerRadius: 25)
                  .stroke(Color.gray, lineWidth: 1)
              }
            )
        }
        .transition(.asymmetric(insertion: .slide, removal: .scale))
      }
      /* - */
      /* Categories Picker */
      if self.showSeriesView || self.showMoviesView {
        Button(action: {
          self.navigationController.showPicker = true
          self.navigationController.showToolbar = false
        }, label: {
          HStack {
            Text(self.moviesController.selectedGenre == nil ? "Catégories" : self.moviesController.selectedGenre!.name)
            Image(systemName: "chevron.down")
          }
          .font(.subheadline)
          .foregroundColor(.white)
          .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
          .background(
            RoundedRectangle(cornerRadius: 25)
              .stroke(Color.gray, lineWidth: 1)
          )
        })
        .transition(.asymmetric(insertion: .slide, removal: .scale))
      }
      /* - */
      Spacer()
    }
    .animation(.bouncy(duration: 0.5), value: self.showSeriesView || self.showMoviesView)
  }
}

#Preview {
  LandingView()
}
