//
//  CriptoTableViewCell.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import UIKit

class CriptoTableViewCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private let symbolLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private let averagePriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .right
        return lbl
    }()
    private let typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = UIColor(named: "generalLabel")
        return lbl
    }()
    private let icon: UIImageView = {
        let ic = UIImageView()
        ic.translatesAutoresizingMaskIntoConstraints = false
        ic.contentMode = .scaleAspectFill
        return ic
    }()
    private let viewContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "cellBackground")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(data: CriptoModel) {
        nameLabel.text = data.attributes.name
        symbolLabel.text = data.attributes.symbol
        averagePriceLabel.text = data.attributes.avgPrice?.currencyFormat(maximumFractionDigits: data.attributes.precisionForFiatPrice ?? 2)
        if  UITraitCollection.current.userInterfaceStyle == .dark {
            icon.sd_setImage(with: URL(string: data.attributes.logoDark))
        } else {
            icon.sd_setImage(with: URL(string: data.attributes.logo))
        }
        
        switch data.type {
        case .commodity:
            typeLabel.backgroundColor = UIColor(named: "commodity")
        case .cryptocoin:
            typeLabel.backgroundColor = UIColor(named: "cryptocoin")
        case .fiat:
            typeLabel.backgroundColor = UIColor(named: "fiat")
        default:
            typeLabel.backgroundColor = UIColor(named: "generalLabel")
        }
    }
    
    private func addViews() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(nameLabel)
        viewContainer.addSubview(symbolLabel)
        viewContainer.addSubview(averagePriceLabel)
        viewContainer.addSubview(icon)
        viewContainer.addSubview(typeLabel)
        makeConstraints()
    }
    
    private func makeConstraints() {
        viewContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        symbolLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12).isActive = true
        symbolLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 2).isActive = true
        averagePriceLabel.rightAnchor.constraint(equalTo: viewContainer.rightAnchor, constant: -20).isActive = true
        averagePriceLabel.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        icon.leftAnchor.constraint(equalTo: viewContainer.leftAnchor, constant: 20).isActive = true
        icon.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 12).isActive = true
        icon.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -12).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: 1).isActive = true
        typeLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: viewContainer.leftAnchor).isActive = true
    }
}
