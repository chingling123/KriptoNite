//
//  WalletViewController.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 11/02/2022.
//

import UIKit

class WalletViewController: UIViewController {
    private let viewModel: WalletsViewModelProtocol
    private let coordinator: WalletsCoordinator?
    private lazy var tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(WalletsTableViewCell.self, forCellReuseIdentifier: WalletsTableViewCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 84
       return tableView
    }()
    
    init(vm: WalletsViewModelProtocol, coordinator: WalletsCoordinator) {
        self.viewModel = vm
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "Wallets"
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.walletListTypes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WalletsTableViewCell.cellId, for: indexPath) as? WalletsTableViewCell else { return UITableViewCell() }
        let data = viewModel.walletListTypes()[indexPath.row]
        cell.configureView(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = viewModel.walletListTypes()[indexPath.row]
        guard let data = viewModel.fetchData(by: type) else { return }
        coordinator?.start(detailsData: data, type: type)
    }
}

private extension WalletViewController {
    func addViews() {
        view.addSubview(tableview)
        makeConstraints()
    }
    
    func makeConstraints() {
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
