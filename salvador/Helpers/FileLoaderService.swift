//
//  DecodeLoadJson.swift
//  salvador
//
//  Created by Geury Roustand on 23.02.23.
//

import Foundation

enum JSONFileError : Error{
    case JSONFileNowFound
}

func FileLoaderService(fileName: String) throws -> APISecretData {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
          let data = try? Data(contentsOf: url ) ,
          let jsonData = try? JSONDecoder().decode(APISecretData.self, from: data)
    else{
        throw JSONFileError.JSONFileNowFound
        
    }
    
    return jsonData
    
}
