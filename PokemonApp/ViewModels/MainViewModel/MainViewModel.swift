//
//  MainViewModel.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import Foundation
import UIKit

class MainViewModel{
    ///Variable de tipo observable bool, se inicializa en falso
    var isLoading: Observable<Bool> = Observable(false)
    ///Variable de tipo observable
    var cellDataSource: Observable<Pokemon> = Observable(nil)
    ///
    //var cellDataSource: Observable<UIColor> = Observable(clear)
    ///
    var dataSource: Pokemon?
    
    //Número de secciones
    func numberOfSections() -> Int{
        return 1
    }
    
    //Número de items en sección
    func numberOfRaws(in section: Int)->Int{
        return self.dataSource?.count ?? 0
    }
    
    //Función obtener datos
    func getData(){
        ///
        if isLoading.value ?? true{
            return
        }
        ///
        isLoading.value = true
        ///Llamar al método fetchItems,
        NetworkManager.fetchItems { [weak self] apiData in
            ///
            self?.isLoading.value = false
            self?.dataSource = apiData
            self?.mapCollectionCell()
        }
    }
    
    //
    func mapCollectionCell(){
        self.cellDataSource.value = self.dataSource
    }
    
    //Obtener nombre
    func getPokemonName(_ pokemon: PokemonClass?)-> String{
        return pokemon?.name.capitalized ?? "Nada por aqui"
    }
    
    //Obtener tipo
    func getPokemonType(_ pokemon: PokemonClass?) -> String{
        return pokemon?.type.uppercased() ?? "Nada por aquí"
    }
    
    //Obtener imagen
    func getPokemonImage(_ pokemon: PokemonClass?) -> URL?{
        ///
        let urlImage = URL(string: pokemon?.imageURL ?? NetworkConstant.shared.defaultImageAddress)
        return urlImage
    }
    
    //
    func retrivePokemon(with id: Int)-> PokemonClass?{
        guard let pokemon = dataSource?.first(where: {$0?.id == id}) else{
            return nil
        }
        return pokemon
    }
    
    //Obtener color
     func assignColor(_ pokemon: PokemonClass?) -> [CGColor] {
         switch pokemon?.type {
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


