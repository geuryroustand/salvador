//
//  ContentView.swift
//  salvador
//
//  Created by Geury Roustand on 03.02.23.
//

import SwiftUI

struct GenerateImageView: View {
    
    //    @StateObject private var viewModel = GenerateImageViewModel()
    
    @ObservedObject  var viewModel = GenerateImageViewModel()
    
    @State  var userInputValue = ""
    
    @State var userIsTyping = false
    
  
   
    var body: some View {
 
        ZStack {
            NavigationView{
                Form {
                    Section{
                        
                        fetchButton
                        
                    }
                    
                }
                .navigationTitle("Type your wish image")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $viewModel.showingAlert){
                    Alert(title: Text("Something went wrong again later"), message: Text("\(viewModel.errorString)"), dismissButton: .default(Text("Got it")))
                }
                
            }
            
            
            if viewModel.isLoading {
                isLoading
                
            }
            
            
            if (viewModel.imageData != nil) {
                
                singleImage
                

            }
            
            
            
        }
        
        
        
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateImageView()
    }
}









// // /////////////////
// WILL BE REMOVE LATER
// // /////////////////


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

