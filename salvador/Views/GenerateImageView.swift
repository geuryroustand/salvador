//
//  ContentView.swift
//  salvador
//
//  Created by Geury Roustand on 03.02.23.
//

import SwiftUI

struct GenerateImageView: View {
    
    @StateObject private var viewModel = GenerateImageViewModel()
    
    //    @ObservableObject private var viewModel = GenerateImageViewModel()
    @State private var userInputValue = ""
    
    @State var userIsTyping = false
    
    
    var body: some View {
        
        ZStack {
            NavigationView{
                Form {
                    Section{
                        HStack {
                            TextField("Generate a image", text: $userInputValue, axis: .vertical)
                            Button("Create"){
                                Task{
                                    
                                    await viewModel.getImage(with: userInputValue)
                                    
                                    userInputValue = ""
                                    
                                    
                                }
                                
                            }
                            .buttonStyle(.borderedProminent)
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
                .navigationTitle("Type your wish image")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
      
            if viewModel.isLoading {
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
            
            
            if let image = viewModel.imageData  {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256)
            }
            
            
            
        }
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateImageView()
    }
}



//ZStack(){
//
//
//    VStack {
//        Text("Create an image")
//            .fontWeight(.black)
//            .font(.largeTitle)
//            .padding([.top])
//
////                Form{
//
//        HStack {
//            TextField("Search" , text: $userInputValue, axis:.vertical)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                    .foregroundColor(.black)
//                    .background(.black.opacity(0.5))
//
//                    .onSubmit(of: .text){
//                        print(userInputValue)
//                }
//
//            Button("Create"){
//
//                Task{
//
//                    do {
//                        let response = try await createImage.shared.generateImage(withPrompt: userInputValue, apiKey: apiSecret)
//
//                        if let  url = response.data.map(\.url).first {
//
//                            let (data, _) = try await URLSession.shared.data(from: url)
//
//                            image  = UIImage(data: data)
//
//
//
//                        }
//                    } catch{
//                        print(error)
//                    }
//                }
//
//
//
//            }
//            .buttonStyle(.borderedProminent)
//        }.padding()
//
////              }
//
//        //placerholder
//
//        if let image  {
//            Image(uiImage: image)
//                   .resizable()
//                   .scaledToFit()
//                   .frame(width: 256)
//        }
//
////                    Image("salvador")
////                        .resizable()
////                        .scaledToFit()
////                        .frame(width: 256)
//
//
//    }
//
//}
