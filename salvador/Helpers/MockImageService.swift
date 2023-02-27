//
//  MockImageService.swift
//  salvador
//
//  Created by Geury Roustand on 27.02.23.
//

import Foundation

class MockCreateImageService: CreateImageService {
    var imageDataResponse: ImageDataResponse?
    var error: Error?

    override func generateImage(withPrompt prompt: String, apiKey: String) async throws -> ImageDataResponse {
        if let error = error {
            throw error
        }

        guard let imageDataResponse = imageDataResponse else {
            throw ImageError.noData
        }

        return imageDataResponse
    }
}
