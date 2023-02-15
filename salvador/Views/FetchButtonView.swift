//
//  FetchButtonView.swift
//  salvador
//
//  Created by Geury Roustand on 15.02.23.
//

import SwiftUI

struct FetchButtonView: View {

    @StateObject private var viewModel = GenerateImageViewModel()
    @Binding var userInputValue:String

    var body: some View {
        Button("Create"){
            Task{

                await viewModel.getImage(with: userInputValue)

                userInputValue = ""

            }

        }
        .buttonStyle(.borderedProminent)
    }
}





