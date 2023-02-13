//
//  apiData.swift
//  salvador
//
//  Created by Geury Roustand on 06.02.23.
//

import Foundation

//Building a Model

struct ImageDataResponse: Decodable
{
    
    struct ImageURL:Codable {
        let url : URL
    }
    
    let created: Int
    let data: [ImageURL]
}
