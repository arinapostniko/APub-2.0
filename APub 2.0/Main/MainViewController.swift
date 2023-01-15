//
//  MainViewController.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 11.01.23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Public properties
    public let mainViewModel = MainViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var revenuePerDayLabel: UILabel!
    @IBOutlet weak var soldBeerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        tableView.dataSource = self
        let nib = UINib(nibName: "BeerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BeerCell")
    }
    
    private func bindViewModel() {
        mainViewModel.revenuePerDay.bind(listener: { [weak self] revenuePerDay in
            self?.revenuePerDayLabel.text = "Revenue per day: \(revenuePerDay)$"
        })
        mainViewModel.soldBeer.bind(listener: { [weak self] soldBeer in
            self?.soldBeerLabel.text = "Sold beer: \(soldBeer) L"
        })
        
        mainViewModel.setupBeers()
    }
    
    private func showNewShiftAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func newShiftButtonAction(_ sender: Any) {
        showNewShiftAlert(withTitle: "You started a new shift!", message: "Earned last shift: \(mainViewModel.revenuePerDay)$\nSold last shift: \(mainViewModel.soldBeer) L")
        print("New Shift!")
        mainViewModel.newShift()
    }
}

