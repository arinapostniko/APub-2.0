//
//  BeerCell.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 12.01.23.
//

import UIKit

protocol BeerCellDelegate: AnyObject {
    func didTapOpenButton()
}

class BeerCell: UITableViewCell {
    
    // MARK: Public properties
    weak var delegate: BeerCellDelegate?
    
    // MARK: - IBOutlet
    @IBOutlet weak var beerCountryLabel: UILabel!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerLeftLabel: UILabel!
    
    @IBOutlet weak var openButton: UIButton!
    
    // MARK: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        openButton.addTarget(self, action: #selector(didTapOpenButton), for: .touchUpInside)
    }
    
    // MARK: - Public methods
    func configure(country: String, name: String, left: Double) {
        beerCountryLabel.text = country
        beerNameLabel.text = name
        beerLeftLabel.text = "Left: \(left) L"
    }
    
    // MARK: - Private methods
    @objc private func didTapOpenButton() {
        delegate?.didTapOpenButton()
    }
}
