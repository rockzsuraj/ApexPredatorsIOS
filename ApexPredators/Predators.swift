//
//  ApexPredators.swift
//  ApexPredators
//
//  Created by Suraj Kumar on 12/04/25.
//

import Foundation

class Predators {
  var apexPredators: [ApexPredator] = [] //var because we will need to change empty array to full of stuff initial value empty array after decode we will store the value here
  
  init(){
    decodeAexPredatorData()
  }
  
  func decodeAexPredatorData() {
    if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
      
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        apexPredators = try decoder.decode([ApexPredator].self, from: data)
        
      } catch {
        print("Error decoding JSON data: \(error)")
      }
    }
  }
}

