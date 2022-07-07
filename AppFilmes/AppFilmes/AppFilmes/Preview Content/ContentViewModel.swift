//
//  ContentViewModel.swift
//  AppFilmes
//
//  Created by Fabio Giulian Marques on 16/10/21.
//

import Foundation




class ContentViewModel: ObservableObject{
  @Published var filme: Filme

  init(){
    self.filme = Filme()
  }

   
  func buscaFilme( title: String ){
   
    
    let newTitle = title.replacingOccurrences(of: " ", with: "+")

    if let url = URL(string: "https://omdbapi.com/?t="+newTitle+"&apikey=fdf5272"){
      
      let task = URLSession.shared.dataTask(with: url) { (dados, response, erro) in

        
        if erro == nil{

          if let dadosRecebidos = dados{

            do{

              if let objJSON = try JSONSerialization.jsonObject(with: dadosRecebidos, options: []) as? [String: Any]{

                if let title = objJSON["Title"] as? String{
                  self.filme.title = title
                }

                if let year = objJSON["Year"] as? String{
                    self.filme.year = year
                }
                if let genre = objJSON["Genre"] as? String{
                    self.filme.genre = genre
                }
                if let writer = objJSON["Writer"] as? String{
                    self.filme.writer = writer
                }
                if let actors = objJSON["Actors"] as? String{
                    self.filme.actors = actors
                }
                if let poster = objJSON["Poster"] as? String{
                    self.filme.poster = poster
                }
                
              }

            }catch{

              print( "Erro ao tratar os dados")

            }

          }

        }else{

          print(erro!)

        }

      }

      task.resume()

    }

  }

   

   

}

