//
//  ItemCollectionViewCell.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 13/02/2022.
//

import UIKit

class CommonWalletCollectionViewCell: UICollectionViewCell {
    public static let cellId = "walletCell"
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private lazy var balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
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
    private lazy var iconDefault: UIImageView = {
        let ic = UIImageView()
        ic.image = UIImage(systemName: "star.fill")
        ic.tintColor = UIColor(named: "defaultWallet")
        ic.translatesAutoresizingMaskIntoConstraints = false
        ic.contentMode = .scaleAspectFill
        ic.isHidden = true
        return ic
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: CommonWalletModel) {
        nameLabel.text = data.name
        if  UITraitCollection.current.userInterfaceStyle == .dark {
            icon.sd_setImage(with: URL(string: data.logoDark ?? ""), placeholderImage: placeholderImage)
        } else {
            icon.sd_setImage(with: URL(string: data.logo ?? ""), placeholderImage: placeholderImage)
        }
        balanceLabel.text = data.balance
        if data.isDefault {
            iconDefault.isHidden = false
        } else {
            iconDefault.isHidden = true
        }
    }
}

private extension CommonWalletCollectionViewCell {
    func commonInit() {
        addViews()
        makeConstraints()
    }
    
    func addViews() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(nameLabel)
        viewContainer.addSubview(balanceLabel)
        viewContainer.addSubview(icon)
        viewContainer.addSubview(iconDefault)
        makeConstraints()
    }
    
    func makeConstraints() {
        viewContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        viewContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 10).isActive = true
        icon.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 75).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        balanceLabel.centerXAnchor.constraint(equalTo: icon.centerXAnchor).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10).isActive = true
        balanceLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -10).isActive = true
        iconDefault.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iconDefault.widthAnchor.constraint(equalToConstant: 25).isActive = true
        iconDefault.leftAnchor.constraint(equalTo: viewContainer.leftAnchor, constant: 10).isActive = true
        iconDefault.bottomAnchor.constraint(equalTo: balanceLabel.bottomAnchor).isActive = true
    }}
