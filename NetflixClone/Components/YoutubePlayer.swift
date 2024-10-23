//
//  YoutubeView.swift
//  NetflixClone
//
//  Created by Jessy Viranaiken on 23/10/2024.
//

import SwiftUI
import WebKit

struct YouTubePlayer: UIViewRepresentable {
  let videoID: String
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
    let request = URLRequest(url: url)
    uiView.load(request)
  }
}

//#Preview {
//  YouTubePlayer()
//}
