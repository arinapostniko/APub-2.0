//
//  MainViewController + TableView.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 11.01.23.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.beers.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        let beer = mainViewModel.beers.value[indexPath.row]
        cell.configure(country: beer.country, name: beer.name, left: beer.remain)
        cell.delegate = self
        return cell
    }
}

extension MainViewController: BeerCellDelegate {
    func didTapOpenButton() {
        print("Tap!")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "BeerViewController") as? BeerViewController,
        let navigationController = navigationController else { return }
        navigationController.pushViewController(destinationViewController, animated: true)
    }
}
