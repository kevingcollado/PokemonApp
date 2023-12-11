//
//  Observable.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import Foundation

//Clase Observable que admita genericos por
class Observable<T>{
    
    //Propiedad computada de tipo genérico opcional que almancena el valor actual del observable
    var value: T?{
        didSet{
            ///Garantizar que se llame la función callback en el hilo principal
            DispatchQueue.main.async {
                ///Cuando algo cambie se llamará al listener y ese actualizará su valor
                self.listener?(self.value)
            }
        }
    }
    
    //Inicializar variable value
    init(_ value: T?) {
        self.value = value
    }
    
    //Propiedad que funciona como callback, se llamará cada que cambie el valor del observable
    private var listener: ((T?) -> Void)?
    
    //Método bind(), toma un callback como argumento y la agrega a la propiedad listener. Se llamará cada vez que cambie el valor del observable
    func bind(_ listener: @escaping((T?)-> Void)){
        listener(value)
        self.listener = listener
    }
}
