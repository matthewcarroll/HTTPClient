//
//  HTTPClient.swift
//  TabbediOS
//
//  Created by Matthew Carroll on 8/29/16.
//  Copyright © 2016 Third Cup lc. All rights reserved.
//

import Foundation

final class HTTPClient {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            let resource = data.flatMap(resource.parse)
            completion(resource)
            }.resume()
    }
}

