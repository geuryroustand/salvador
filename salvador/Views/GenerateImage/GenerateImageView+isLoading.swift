//
//  GenerateImageView+isLoading.swift
//  salvador
//
//  Created by Geury Roustand on 16.02.23.
//

import Foundation
import SwiftUI

extension GenerateImageView {
  var isLoading: some View {
        ZStack {
            Color(.white)
                .opacity(0.3)
                .ignoresSafeArea()
            ProgressView("Creating your image")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemBackground))
                )
                .shadow(radius: 10)
            
        }

    }
    
}
