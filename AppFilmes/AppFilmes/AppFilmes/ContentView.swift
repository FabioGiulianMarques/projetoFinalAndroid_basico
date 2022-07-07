//
//  ContentView.swift
//  AppFilmes
//
//  Created by Fabio Giulian Marques on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State var title = String()
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1.0){
            Text("INFORMAÇÕES SOBRE FILMES")
                .padding(10)
                .multilineTextAlignment(.center)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .alignmentGuide(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Guide@*/.leading/*@END_MENU_TOKEN@*/, computeValue: { dimension in
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/dimension[.leading]/*@END_MENU_TOKEN@*/
                })
            TextField("Digite o nome do Filme", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            Button(action:{
                self.viewModel.buscaFilme(title: self.title)
                
            } ) {
                              
                HStack(alignment: .center){
                    Image(systemName:"video.circle.fill")
                        .font(.title)
                Text("Consultar Filme")
                    .multilineTextAlignment(.center)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(10)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
               
            }
            .padding()
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack{
                Text("Título: ")
                Text(self.viewModel.filme.title)
            }.padding()
            
            HStack{
                Text("Ano:")
                    .multilineTextAlignment(.leading)
                Text(self.viewModel.filme.year)
            }.padding()
            
            HStack{
                Text("Gênero:")
                Text(self.viewModel.filme.genre)
            }.padding()
            
            HStack{
                Text("Autores:")
                Text(self.viewModel.filme.writer)
            }.padding()
            
            HStack{
                Text("Atores:")
                Text(self.viewModel.filme.actors)
            }.padding()
            
                HStack{
                   
                    
                    Button("Poster"){
                                openURL(URL(string: self.viewModel.filme.poster)!)
                        
                    }
                    .frame(width: 280, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    
                  // Text(self.viewModel.filme.poster)
                }
            
            
            
            
        }.padding(.leading, 0.0)
        
        
        
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
