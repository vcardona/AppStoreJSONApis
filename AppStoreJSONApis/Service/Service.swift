//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 20/01/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service() //singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()){
        print("Fetching itunes from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
                guard let url = URL(string: urlString) else {return}
                //fetch data form internet
                URLSession.shared.dataTask(with: url) {(data, resp, err) in
                    
                    if let err = err{
                        print("Failed to fetch apps:",err)
                        completion([], nil)
                        return
                    }
                    guard let data = data else{return}
                    
                    do{
                        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                        
                        completion(searchResult.results, nil)
                        
        //                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                    }catch let jsonErr{
                        print("Failed to decode json:", jsonErr)
                        completion([], jsonErr)
                    }
                    //success
                }.resume()//fires off the request
    }
}