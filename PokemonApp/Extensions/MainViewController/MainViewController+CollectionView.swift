//
//  MainViewController+CollectionView.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import Foundation
import UIKit
import Kingfisher

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //Configuración de protocolos delegado y dataSource
    func setupTableView(){
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.delegate = self
        
        self.registerCells()
    }
    
    //Registro de celdas
    func registerCells(){
        mainCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCollectionViewCell")
    }
    
    //Refescar UICollectionView
    func reloadUICollection(){
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
    
    //Configuración de secciones
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mainViewModel.numberOfSections()
    }
    
    //Configuración de número de items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel.numberOfRaws(in: section)
    }
    
    //Pintado de colección
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ///Crear celda
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        let pokemonData = cellDataSource?[indexPath.row]
        ///Pasar datos del modelo a la celda
        cell.nameLabel.text = mainViewModel.getPokemonName(pokemonData)
        cell.typeLabel.text = mainViewModel.getPokemonType(pokemonData)
        cell.imgView.kf.setImage(with: mainViewModel.getPokemonImage(pokemonData))
        cell.mainView.layer.backgroundColor = mainViewModel.assignColor(pokemonData)[0]
        cell.backgroundTypeView.layer.backgroundColor = mainViewModel.assignColor(pokemonData)[1]
        return cell
    }
    
    //Funcionalidad
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonData = cellDataSource?[indexPath.row]?.id
            self.openDetails(pokemonID: pokemonData ?? 0)
    }
}
