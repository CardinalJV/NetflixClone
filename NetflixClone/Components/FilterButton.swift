  //
  //  FilterButton.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 17/10/2024.
  //

import SwiftUI

struct FilterButton: View {
  
  let moviesController: MoviesController
  
  @Binding var showSeriesView: Bool
  @Binding var showMoviesView: Bool
  @Binding var showPicker: Bool
  
  var body: some View {
    HStack{
      /* Delete button */
      if self.showSeriesView || self.showMoviesView {
        Button {
          self.showSeriesView = false
          self.showMoviesView = false
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
      /* Picker de catégories */
      if self.showSeriesView || self.showMoviesView {
        Button(action: {
          self.showPicker = true
        }, label: {
          HStack {
            Text("Catégories")
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
  SplashScreenView()
}
