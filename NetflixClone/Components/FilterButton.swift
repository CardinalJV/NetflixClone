  //
  //  FilterButton.swift
  //  NetflixClone
  //
  //  Created by Jessy Viranaiken on 17/10/2024.
  //

import SwiftUI

struct FilterButton: View {
  
  @Binding var showSeriesView: Bool
    //  @Binding var showMoviesView: Bool
    //  @Binding var showSeriesView: Bool
  
  
  var body: some View {
    HStack{
      if self.showSeriesView {
        Button {
          self.showSeriesView = false
        } label: {
          Image(systemName: "xmark")
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(7)
            .background(
              RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 1) // Bordure blanche
            )
        }
      }
      Button {
        if self.showSeriesView == true {
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
      Button {
        print("Films")
      } label: {
        Text("Films")
          .font(.subheadline)
          .foregroundColor(.white)
          .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
          .background(
            RoundedRectangle(cornerRadius: 25)
              .stroke(Color.gray, lineWidth: 1)
          )
      }
      Button {
        print("Categories")
      } label: {
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
      }
      Spacer()
    }
  }
}

#Preview {
  SplashScreenView()
}
