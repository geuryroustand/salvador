//
//  apiData.swift
//  salvador
//
//  Created by Geury Roustand on 06.02.23.
//

import Foundation

struct apiData: Codable {
    
   struct urlImageResponse:Codable {
        let url : URL
    }
    
    let created: Int
    let data: [urlImageResponse]
}
