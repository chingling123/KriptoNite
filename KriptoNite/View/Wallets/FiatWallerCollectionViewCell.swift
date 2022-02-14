//
//  FiatWallerCollectionViewCell.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 13/02/2022.
//

import UIKit

class FiatWallerCollectionViewCell: UICollectionViewCell {
    public static let cellId = "fiatWalletCell"
    private lazy var balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .right
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
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .center
        lbl.text = "Current Balance"
        lbl.layer.cornerRadius = 5
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = UIColor(named: "labelBackground")
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: CommonWalletModel) {
        if  UITraitCollection.current.userInterfaceStyle == .dark {
            icon.sd_setImage(with: URL(string: data.logoDark ?? ""), placeholderImage: placeholderImage)
        } else {
            icon.sd_setImage(with: URL(string: data.logo ?? ""), placeholderImage: placeholderImage)
        }
        balanceLabel.text = data.balance.humberFormat(maximumFractionDigits: 2, currencyCode: data.symbol)
    }
}

private extension FiatWallerCollectionViewCell {
    func commonInit() {
        addViews()
        makeConstraints()
    }
    
    func addViews() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(titleLabel)
        viewContainer.addSubview(balanceLabel)
        viewContainer.addSubview(icon)
        makeConstraints()
    }
    
    func makeConstraints() {
        viewContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        viewContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 12).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        balanceLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        icon.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 12).isActive = true
        icon.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -10).isActive = true
    }}
