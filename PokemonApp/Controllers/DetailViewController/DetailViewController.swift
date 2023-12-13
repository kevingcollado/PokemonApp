//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 11/12/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var backgroundImageView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //Crear ViewModel
    var detailViewModel: DetailViewModel
    
    //Inicializar ViewModel y ViewController
    init(detailViewModel: DetailViewModel){
        self.detailViewModel = detailViewModel
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView(){
        self.title = "Detail Pokemon"
        nameLabel.text = detailViewModel.namePokemon.capitalized
        typeLabel.text = detailViewModel.typePokemon.capitalized
        attackLabel.text = "Ataque: \(detailViewModel.attackPokemon.description)"
        defenseLabel.text = "Defensa: \(detailViewModel.defensePokemon.description)"
        descriptionLabel.text = detailViewModel.descriptionPokemon
        imageView.kf.setImage(with: detailViewModel.getPokemonImage(detailViewModel.imagePokemon ?? NetworkConstant.shared.defaultImageAddress))
    }
}
