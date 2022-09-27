//
//  ViewController.swift
//  Pokemon app
//
//  Created by Robert Steed on 9/21/22.
//

import UIKit
import RyansPokemonPackage

class ViewController: UIViewController {

    @IBOutlet weak var PokemonImageView: UIImageView!

    @IBOutlet weak var PokemonButton: UIButton!
    @IBOutlet weak var PokemonLabel: UILabel!
    
    @IBOutlet weak var typesStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PokemonButton.layer.cornerRadius = PokemonButton.bounds.height / 3
    }
    
    @IBAction func NewPokemonButtonTapped(_ sender: Any) {
        Task {
            let pokemon = await getRandomPokemon()
            PokemonLabel.text = pokemon.name
            PokemonImageView.setPokemon(pokemon: pokemon)
            for view in typesStackView.arrangedSubviews {
                view.removeFromSuperview()
            }
            for pType in pokemon.types {
                let label = UILabel()
                label.text = pType
                typesStackView.addArrangedSubview(label)
                
            }
        }
    }
    
}





