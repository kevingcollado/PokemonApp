//
//  NetworkConstant.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import Foundation

class NetworkConstant{
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init(){
        //Singletone
    }
    
    public var apiAddress: String{
        get{
            return "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        }
    }
    
    public var defaultImageAddress: String{
        get{
            return "https://aeasa.com.mx/wp-content/uploads/2020/02/SIN-IMAGEN.jpg"
        }
    }
    
}
