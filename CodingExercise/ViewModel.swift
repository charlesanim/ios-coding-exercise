//
//  ViewModel.swift
//  CodingExercise
//
//  Created by Charles Anim on 1/31/22.
//

import Foundation

struct Picture: Identifiable, Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

class ViewModel: ObservableObject {
    @Published var photoArray = [Picture]()
    
    
    init() {
            loadData()
        }
    
    func loadData() {
        let url = "https://jsonplaceholder.typicode.com/album/1/photos/"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode([Picture].self, from: data)
                for photo in json {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
