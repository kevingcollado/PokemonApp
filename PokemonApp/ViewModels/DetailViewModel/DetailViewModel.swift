//
//  DetailViewModel.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 11/12/23.
//

import Foundation
import CoreGraphics
import UIKit

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
    
    //Obtener color
    func assignColorForDetailVC(_ pokemon: String) -> [CGColor] {
        switch pokemonClass.type {
       case "fire":
            return [UIColor(_colorLiteralRed: 0.9373, green: 0.1373, blue: 0.2353, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0.851, green: 0.0157, blue: 0.1608, alpha: 1).cgColor]
       case "poison":
            return [UIColor(_colorLiteralRed: 0.4824, green: 0.1725, blue: 0.749, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0.3529, green: 0.0941, blue: 0.6039, alpha: 1).cgColor]
       case "water":
            return [UIColor(_colorLiteralRed: 0, green: 0.7059, blue: 0.8471, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0, green: 0.5882, blue: 0.7804, alpha: 1).cgColor]
       case "electric":
            return [UIColor(_colorLiteralRed: 1, green: 0.7176, blue: 0, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 1, green: 0.6353, blue: 0, alpha: 1).cgColor]
       case "normal":
            return [UIColor(_colorLiteralRed: 0.298, green: 0.3608, blue: 0.4078, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0.2745, green: 0.2863, blue: 0.298, alpha: 1).cgColor]
       case "ground":
            return [UIColor(_colorLiteralRed: 0.4824, green: 0.4196, blue: 0.2627, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0.4078, green: 0.3373, blue: 0.2039, alpha: 1).cgColor]
       case "flying":
            return [UIColor(_colorLiteralRed: 0.6784, green: 0.9098, blue: 0.9569, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0.2824, green: 0.7922, blue: 0.8941, alpha: 1).cgColor]
       case "fairy":
            return [UIColor(_colorLiteralRed: 1, green: 0.4588, blue: 0.5608, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 1, green: 0.302, blue: 0.4275, alpha: 1).cgColor]
        case "bug":
             return [UIColor(_colorLiteralRed: 0.6549, green: 0.7882, blue: 0.3412, alpha: 1).cgColor,
                     UIColor(_colorLiteralRed: 0.4157, green: 0.6, blue: 0.3059, alpha: 1).cgColor]
        case "dragon":
             return [UIColor(_colorLiteralRed: 0.0941, green: 0.3059, blue: 0.4667, alpha: 1).cgColor,
                     UIColor(_colorLiteralRed: 0, green: 0.1882, blue: 0.2863, alpha: 1).cgColor]
       default:
            return [UIColor(_colorLiteralRed: 1, green: 0, blue: 0.3294, alpha: 1).cgColor,
                    UIColor(_colorLiteralRed: 0.6196, green: 0, blue: 0.349, alpha: 1).cgColor]
       }
   }
}
