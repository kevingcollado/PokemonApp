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
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewImageColor: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeViewBackgroundColor: UIView!
    
    
    //Variables
    private var cornerRadius: CGFloat = 10.0
    
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
        configureShadow()
        configureLayout()
        configureBrackgroundTypeView()
    }
    
    func configView(){
        self.title = "Vista detallada"
        nameLabel.text = detailViewModel.namePokemon.capitalized
        typeLabel.text = detailViewModel.typePokemon.capitalized
        attackLabel.text = "Ataque: \(detailViewModel.attackPokemon.description) p."
        defenseLabel.text = "Defensa: \(detailViewModel.defensePokemon.description) p."
        descriptionLabel.text = detailViewModel.descriptionPokemon
        imageView.kf.setImage(with: detailViewModel.getPokemonImage(detailViewModel.imagePokemon ?? NetworkConstant.shared.defaultImageAddress))
        viewImageColor.layer.backgroundColor = detailViewModel.assignColorForDetailVC(detailViewModel.typePokemon)[0]
        typeViewBackgroundColor.layer.backgroundColor = detailViewModel.assignColorForDetailVC(detailViewModel.typePokemon)[1]
    }
    
    private func configureShadow() {
        // How blurred the shadow should be
        viewImageColor.layer.shadowRadius = 10.0

        // How far the shadow is offset from the cell's frame
        viewImageColor.layer.shadowOffset = CGSize(width: 0, height: 10)

        // The transparency of the shadow. Ranging from 0.0 (transparent) to 1.0 (opaque).
        viewImageColor.layer.shadowOpacity = 0.45

        // The default color is black
        viewImageColor.layer.shadowColor = UIColor.black.cgColor
        
        // To avoid the shadow to be clipped to the corner radius
        viewImageColor.layer.cornerRadius = cornerRadius
        viewImageColor.layer.masksToBounds = false
    }
    
    private func configureLayout() {
        viewImageColor.layer.cornerRadius = cornerRadius
        viewImageColor.layer.masksToBounds = true
    }
    
    private func configureBrackgroundTypeView(){
        typeViewBackgroundColor.layer.cornerRadius = cornerRadius
        viewImageColor.layer.masksToBounds = true
    }
}
