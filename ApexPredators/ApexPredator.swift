//
//  ApexPredator.swift
//  ApexPredators
//
//  Created by Suraj Kumar on 12/04/25.
//

import SwiftUI

struct ApexPredator: Decodable, Identifiable {
  let id: Int
  let name: String
  let type: ApType
  let latitude: Double
  let longitude: Double
  let movies: [String]
  let movieScenes: [MovieScene]
  let link: String
  
  var image: String {
    name.lowercased().replacingOccurrences(of: " ", with: "")
  }
  
  struct MovieScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
  }
}

enum ApType: String, Decodable, CaseIterable, Identifiable {
  case all
  case land
  case air
  case sea
  
  var id: ApType {
     self
  }
  
  var background: Color {
    switch self {
    case .land:
        .brown
    case .air:
        .teal
    case .sea:
        .blue
    case .all:
        .black
    }
  }
  
  var icon: String {
    switch self {
      case .land:
      return "😃"
    case .air:
      return "🛩️"
    case .sea:
      return "🌊"
    case .all:
      return "🔄"
    }
  }
  
  
  
}

