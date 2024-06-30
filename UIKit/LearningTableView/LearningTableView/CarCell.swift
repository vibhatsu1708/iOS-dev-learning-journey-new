//
//  CarCell.swift
//  LearningTableView
//
//  Created by Vedant Mistry on 30/06/24.
//

import UIKit

class CarCell: UITableViewCell {
    
    var carImageView = UIImageView()
    var carTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(carImageView)
        addSubview(carTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(car: Car) {
        carImageView.image = car.image
        carTitleLabel.text = car.title
    }
    
    func configureImageView() {
        carImageView.layer.cornerRadius = 15
        carImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        carTitleLabel.numberOfLines = 0
        carTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        carImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        carImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        carImageView.widthAnchor.constraint(equalTo: carImageView.heightAnchor, multiplier: 14/9).isActive = true
    }

    func setLabelConstraints() {
        carTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        carTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        carTitleLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 20).isActive = true
        carTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        carTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
