//
//  MainViewController+SearchController.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 15/12/23.
//

import Foundation
import UIKit

extension MainViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print("DEBUG PRINT:", searchController.searchBar.text)
    }
}
