//
//  DetailViewModel.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 11/12/23.
//

import Foundation

class DetailViewModel{
    var pokemonClass: PokemonClass
    
    var imagePokemon: String?
    var namePokemon: String
    var typePokemon: String
    var attackPokemon: Int
    var defensePokemon: Int
    var descriptionPokemon: String
    var idPokemon: Int
    
    
    init(pokemonClass: PokemonClass){
        self.pokemonClass = pokemonClass
        
        self.idPokemon = pokemonClass.id
        self.imagePokemon = pokemonClass.imageURL
        self.namePokemon = pokemonClass.name
        self.typePokemon = pokemonClass.type
        self.attackPokemon = pokemonClass.attack
        self.defensePokemon = pokemonClass.defense
        self.descriptionPokemon = pokemonClass.description
    }
    
    //Obtener imagen
    func getPokemonImage(_ pokemon: String) -> URL?{
        ///
        let urlImage = URL(string: pokemonClass.imageURL) /* */
        return urlImage
    }
}
