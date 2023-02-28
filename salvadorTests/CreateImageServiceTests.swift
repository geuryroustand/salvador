//
//  FetchImage_Tests.swift
//  salvadorTests
//
//  Created by Geury Roustand on 22.02.23.
//

import XCTest

@testable import salvador

final class FetchImageTests: XCTestCase {
    
    var createImage: CreateImageService!
    var viewModel :GenerateImageView.ViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        createImage = CreateImageService()
        viewModel = GenerateImageView.ViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        createImage = nil
        viewModel = nil
    }
    
    
    func testGenerateImage_WithValidData_ShouldReturnImageDataResponse() async throws {
        // Arrange
        let mockService = MockCreateImageService()
        
        let imageDataResponse = ImageDataResponse(created: 123, data: [ImageDataResponse.ImageURL(url: URL(string: "https://example.com/image.png")!)])
        mockService.imageDataResponse = imageDataResponse
        
        
        let result = try await mockService.generateImage(withPrompt: "test prompt", apiKey: "test api key")
        
        XCTAssertEqual(result.created, imageDataResponse.created)
        XCTAssertEqual(result.data.first?.url, imageDataResponse.data.first?.url)
        XCTAssertNotNil(result.data)
        XCTAssertEqual(result.data.count, 1)
        XCTAssertNotNil(result.data[0].url)
    }
    
    
    func testGenerateImage_WithInvalidData_ShouldThrowError() async throws {
        
        let mockService = MockCreateImageService()
        mockService.error = ImageError.noData
        
        
        do {
            let _ = try await mockService.generateImage(withPrompt: "test prompt", apiKey: "test api key")
            XCTFail("Error should have been thrown")
        } catch {
            XCTAssertTrue(error is ImageError)
        }
    }
    
}
