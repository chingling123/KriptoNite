//
//  WalletDetailsViewController.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 13/02/2022.
//

import Foundation
import UIKit

class WalletDetailsViewController: UIViewController {
    private let detailsData: [CommonWalletModel]
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CommonWalletCollectionViewCell.self, forCellWithReuseIdentifier: CommonWalletCollectionViewCell.cellId)
        collectionView.register(FiatWallerCollectionViewCell.self, forCellWithReuseIdentifier: FiatWallerCollectionViewCell.cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = false
       return collectionView
    }()
    
    init(data: [CommonWalletModel], type: String) {
        detailsData = data
        super.init(nibName: nil, bundle: nil)
        title = type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension WalletDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailsData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = detailsData[indexPath.row]
        
        if data.type == .fiatWallet {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiatWallerCollectionViewCell.cellId, for: indexPath) as? FiatWallerCollectionViewCell {
                cell.configure(data: data)
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonWalletCollectionViewCell.cellId, for: indexPath) as? CommonWalletCollectionViewCell {
                cell.configure(data: data)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.frame.origin.x = -cell.frame.width
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            cell.frame.origin.x = 0
        }, completion: nil)
    }
}

private extension WalletDetailsViewController {
    func setupView() {
        view.addSubview(collectionView)
        setupNavigationBar()
        makeConstraints()
    }
    
    func makeConstraints() {
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupNavigationBar() {
        let deafultBackIcon = UIImage(systemName: "arrow.backward.circle")
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: deafultBackIcon, style: .plain, target: self, action: #selector(back(sender:)))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "generalLabel")
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated:true)
    }
}
