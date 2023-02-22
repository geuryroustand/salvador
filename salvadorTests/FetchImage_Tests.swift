//
//  FetchImage_Tests.swift
//  salvadorTests
//
//  Created by Geury Roustand on 22.02.23.
//

import XCTest

@testable import salvador

final class FetchImage_Tests: XCTestCase {
    
    var createImage: CreateImage!
    var viewModel : GenerateImageViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        createImage = CreateImage()
        viewModel = GenerateImageViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        createImage = nil
        viewModel = nil
    }
    
    func testGenerateImage_SuccessFulResponsw() async throws {
        let prompt = "Create a mango eating an apple with sunglases on the beach"
        
        let apiKey = await viewModel.loadJson(fileName: "APISecret")
        
        let result = try await createImage.generateImage(withPrompt: prompt, apiKey: apiKey.APISecret)
        
        XCTAssertNotNil(result.data)
        XCTAssertEqual(result.data.count, 1)
        XCTAssertNotNil(result.data[0].url)
        
        
    }
    
    
}
