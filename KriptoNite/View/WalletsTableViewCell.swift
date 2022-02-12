//
//  WalletsTableViewCell.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import UIKit

class WalletsTableViewCell: UITableViewCell {
    public static let cellId = "walletCell"
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(named: "generalLabel")
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private lazy var typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = UIColor(named: "generalLabel")
        return lbl
    }()
    private lazy var viewContainer: UIView = {
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
    
    func configureView(data: WalletsType) {
        nameLabel.text = data.rawValue
        typeLabel.backgroundColor = data.color
    }
    
    private func addViews() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(nameLabel)
        viewContainer.addSubview(typeLabel)
        makeConstraints()
    }
    
    private func makeConstraints() {
        viewContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: 1).isActive = true
        typeLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: viewContainer.leftAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: typeLabel.rightAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 12).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: viewContainer.rightAnchor, constant: -12).isActive = true
    }
}
