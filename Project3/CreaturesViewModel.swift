//
//  CreaturesViewModel.swift
//  Project3
//
//  Created by Seana Marie Lanias on 12/8/22.
//

import Foundation

@MainActor
class CreaturesViewModel: ObservableObject {
    
    struct Returned: Codable {
        var count: Int
        var next: String
        var results: [Species]
    }
    
//    struct Species: Codable, Hashable {
//        var name: String
//        var classification: String
//        var designation: String
//        var average_height: String
//        var skin_colors: String
//        var average_lifespan: String
//        var language: String
//    }
    
    @Published var urlString = "https://swapi.dev/api/species/"
    @Published var count = 0
    @Published var speciesArray: [Species] = []
    
    func getData() async {
        print ("we are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("An error occurred")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let species = try? JSONDecoder().decode(Returned.self, from: data) else {
                print ("error occurred could not decode json")
                return
            }
            self.count = species.count
            self.urlString = species.next
            self.speciesArray = species.results
//            print ("Json returned! count: \(species.count), next: \(species.next)")
        }
        catch {
            print("couldn't get data from url string")
        }
    }
}
