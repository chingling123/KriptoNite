//
//  CriptoTableViewCell.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import UIKit

class CriptoTableViewCell: UITableViewCell {

    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private let symbolLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private let averagePriceLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private let icon : UIImageView = {
        let ic = UIImageView()
        ic.translatesAutoresizingMaskIntoConstraints = false
        ic.contentMode = .scaleAspectFill
        return ic
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
        icon.sd_setImage(with: URL(string: data.attributes.logo))
    }
    
    private func addViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(averagePriceLabel)
        contentView.addSubview(icon)
        makeConstraints()
    }
    
    private func makeConstraints() {
        nameLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        symbolLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12).isActive = true
        symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        averagePriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12).isActive = true
        averagePriceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        icon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
