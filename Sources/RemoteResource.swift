//
//  RemoteResource.swift
//  TabbediOS
//
//  Created by Matthew Carroll on 8/29/16.
//  Copyright © 2016 Third Cup lc. All rights reserved.
//

import Foundation

struct Resource<T> {
    
    let url: URL
    let parse: (Data) -> T?
}

extension Resource {
    
    init(url: URL, parseJSON: @escaping (Any) -> T?) {
        self.url = url
        parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}
