//
//  BeerViewModel.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 12.01.23.
//

import Foundation

class BeerViewModel {
    var beer = Bindable(BeerModel(country: "", name: "", price: 0, remain: 0))
    var remains = Bindable(Double(0))
    var allBeerPrice = Bindable(Double(0))
    var price = Bindable(Double(0))
}

extension BeerViewModel: BeerViewModelProtocol {
    func buyBeer(index: Int, volume: Double) -> Double {
        print("Buy")
        return 0
    }
}
