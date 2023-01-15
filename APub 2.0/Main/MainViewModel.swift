//
//  MainViewModel.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 12.01.23.
//

import Foundation

class MainViewModel {
    var beers = Bindable([BeerModel]())
    
    var revenuePerDay = Bindable(Double(0.0))
    var soldBeer = Bindable(Double(0.0))
}

extension MainViewModel: MainViewModelProtocol {
    func setupBeers() {
        beers.value.append(BeerModel(country: "🇲🇽", name: "Corona", price: 1.4, remain: 100))
        beers.value.append(BeerModel(country: "🇺🇸", name: "Budweiser", price: 0.8, remain: 89))
        beers.value.append(BeerModel(country: "🇳🇱", name: "Heineken", price: 1, remain: 68))
    }
    
    func newShift() {
        revenuePerDay = Bindable(0.0)
        soldBeer = Bindable(0.0)
    }
}
