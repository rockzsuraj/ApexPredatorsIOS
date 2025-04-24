//
//  ApexPredators.swift
//  ApexPredators
//
//  Created by Suraj Kumar on 12/04/25.
//

import Foundation

class Predators {
  var allApexPredators: [ApexPredator] = []
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
        allApexPredators = try decoder.decode([ApexPredator].self, from: data)
        apexPredators = allApexPredators
        
      } catch {
        print("Error decoding JSON data: \(error)")
      }
    }
  }
  
  func search(for searchTerm: String) -> [ApexPredator] {
    if searchTerm.isEmpty {
      return apexPredators
    } else {
      return apexPredators.filter {
        predator in predator.name.localizedCaseInsensitiveContains(searchTerm)
      }
    }
    
  }
  
  func sort(by alphabetical: Bool) {
    apexPredators.sort {
      predator1, predator2 in
        if alphabetical {
          predator1.name < predator2.name
        } else {
          predator1.id < predator2.id
        }
      }
    }
  
  func filter(by type: ApType) {
    if type == .all {
      apexPredators = allApexPredators
    } else {
      apexPredators = allApexPredators.filter {
        predator in
        predator.type == type
      }
    }
  }
}

