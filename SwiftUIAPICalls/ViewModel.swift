//
//  ViewModel.swift
//  SwiftUIAPICalls
//
//  Created by William Rozier on 8/27/23.
//

import Foundation

struct Course: Hashable, Codable {
    let name: String
    let image: String
}



class ViewModel: ObservableObject{
    @Published var courses: [Course] = []
    
    
    func fetch() {
        guard let url = URL(string:"https://iosacadmey.io/api/v1/courses/index.php") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){[weak self]
            data,   _, error in
            guard let data, error == nil else {
                return
            }
            
            //convert to json with do catch block
            do {
                let courses = try
                JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                 print(error)
            }
        }
            task.resume()
    }
}
