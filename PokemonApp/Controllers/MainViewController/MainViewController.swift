//
//  MainViewController.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import UIKit

class MainViewController: UIViewController {
    //Outlets
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //Referencia a ViewModel
    var mainViewModel : MainViewModel = MainViewModel()
    
    //Variables
    var cellDataSource: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        mainViewModel.getData()
    }
    
    //Configuración de vista
    func setupView(){
        self.navigationItem.title = "Pókedex"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }
    
    //Encadenar conexión con ViewModel
    func bindViewModel(){
        ///Establecer conexión entre activity indicator y propiedad isLoading
        ///[weak self] garantiza que la autoreferencia se capture debilmente, evitando un ciclo de rerención.
        mainViewModel.isLoading.bind { [weak self] isLoading in
            ///Si self o isLoading es nulo, se termina el escope
            guard let self = self, let isLoading = isLoading else {
                return
            }
            ///Actualizar la interfáz de usuario en el hilo principal.
            DispatchQueue.main.async {
                ///Si isLoading es verdadero, se inicia la animación
                if isLoading{
                    self.activityIndicator.startAnimating()
                    self.activityIndicator.isHidden = false
                    ///De lo contrario se detiene la animación
                }else{
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
        }
        
        ///
        mainViewModel.cellDataSource.bind { [weak self] pokemonData in
            self?.cellDataSource = pokemonData
            self?.reloadUICollection()
        }
    }
}
