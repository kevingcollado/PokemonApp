//
//  PokemonCollectionViewCell.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    //Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundTypeView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    
    //Variables
    private var cornerRadius: CGFloat = 10.0

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
        configureShadow()
        configureBrackgroundTypeView()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        
    }
    
    private func configureShadow() {
        // How blurred the shadow should be
        layer.shadowRadius = 2

        // How far the shadow is offset from the cell's frame
        layer.shadowOffset = CGSize(width: 0, height: 2)

        // The transparency of the shadow. Ranging from 0.0 (transparent) to 1.0 (opaque).
        layer.shadowOpacity = 0.45

        // The default color is black
        layer.shadowColor = UIColor.black.cgColor
        
        // To avoid the shadow to be clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
    }
    
    private func configureLayout() {
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .blue
        //contentView.backgroundColor = .secondarySystemGroupedBackground
    }
    
    private func configureBrackgroundTypeView(){
        backgroundTypeView.layer.cornerRadius = 5
    }

}
