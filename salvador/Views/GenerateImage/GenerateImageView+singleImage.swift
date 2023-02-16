//
//  GenerateImageView+singleImage.swift
//  salvador
//
//  Created by Geury Roustand on 16.02.23.
//

import Foundation
import SwiftUI


extension GenerateImageView {

    var singleImage: some View {
        Image(uiImage:viewModel.imageData!)
            .resizable()
            .scaledToFit()
            .frame(width: 256)

    }
}
