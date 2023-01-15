//
//  BeerViewController.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 12.01.23.
//

import UIKit

class BeerViewController: UIViewController {
    
    // MARK: - Public properties
    public let beerViewModel = BeerViewModel()

    // MARK: - IBOutlets
    @IBOutlet weak var beerCountry: UILabel!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerLeft: UILabel!
    @IBOutlet weak var beerPrice: UILabel!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBeer()
        bindViewModel()
    }
    
    // MARK: - Private methods
    private func setupBeer() {
        beerCountry.text = beerViewModel.beer.value.name
        beerName.text = beerViewModel.beer.value.name
        beerPrice.text = "Price: \(beerViewModel.price.value) for 1 L"
    }
    
    private func bindViewModel() {
        beerViewModel.remains.bind(listener: { [weak self] remains in
            self?.beerLeft.text = "Left: \(remains) L"
        })
    }
    
    // MARK: - IBActions
    @IBAction func buyBeer(_ sender: UIButton) {
        let tag = sender.tag
        let volume: Double
        let beerIndex = tag
        
        switch tag % 10 {
        case 0:
            volume = 0.33
        case 1:
            volume = 0.5
        case 2:
            volume = 1.0
        default:
            volume = 0
        }
        
        let price = beerViewModel.buyBeer(index: beerIndex, volume: volume)
        print(price)
    }
}
