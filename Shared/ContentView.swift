//
//  ContentView.swift
//  Shared
//
//  Created by Full Queue Developer on 6/22/22.
//

import SwiftUI

struct ContentView: View {
  @State var text: String = "Loading..."
  var body: some View {
    Text(text)
      .padding()
      .onAppear() {
        loadTextFile()
      }
  }

  func loadTextFile() {
    Task {
      let (data, _) = try await URLSession.shared.data(for: URLRequest(url: URL(string: "https://www.tomorrow.io/weather-api/")!))
      let string = String(data: data, encoding: .utf8)
      self.text = string ?? "error"
    }
  }
}
