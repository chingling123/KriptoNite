//
//  CriptoTableViewCell.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import UIKit

class CriptoTableViewCell: UITableViewCell {
    public static let cellId = "criptoCell"
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private lazy var symbolLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private lazy var averagePriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .right
        return lbl
    }()
    private lazy var typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = UIColor(named: "generalLabel")
        return lbl
    }()
    private lazy var icon: UIImageView = {
        let ic = UIImageView()
        ic.translatesAutoresizingMaskIntoConstraints = false
        ic.contentMode = .scaleAspectFill
        return ic
    }()
    private lazy var viewContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "cellBackground")
        return view
    }()
    private lazy var placeholderImage: UIImage? = {
        let img = UIImage(systemName: "photo.circle")?.withRenderingMode(.alwaysTemplate)
            .withTintColor(UIColor(named: "generalLabel") ?? .systemBackground)
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(data: CriptoModel) {
        nameLabel.text = data.attributes.name
        symbolLabel.text = data.attributes.symbol
        averagePriceLabel.text = data.attributes.avgPrice?.currencyFormat(maximumFractionDigits: data.attributes.precisionForFiatPrice ?? 2)
        if  UITraitCollection.current.userInterfaceStyle == .dark {
            icon.sd_setImage(with: URL(string: data.attributes.logoDark), placeholderImage: placeholderImage)
        } else {
            icon.sd_setImage(with: URL(string: data.attributes.logo), placeholderImage: placeholderImage)
        }
        typeLabel.backgroundColor = data.type.color
    }
}

private extension CriptoTableViewCell {
    func commonInit() {
        addViews()
        makeConstraints()
    }
    
    func addViews() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(nameLabel)
        viewContainer.addSubview(symbolLabel)
        viewContainer.addSubview(averagePriceLabel)
        viewContainer.addSubview(icon)
        viewContainer.addSubview(typeLabel)
        makeConstraints()
    }
    
    func makeConstraints() {
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
