//
//  ViewController.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import UIKit

class CriptosViewController: UIViewController {
    private let viewModel: CriptosViewModelProtocol
    private lazy var tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(CriptoTableViewCell.self, forCellReuseIdentifier: CriptoTableViewCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 84
       return tableView
    }()
    private lazy var segmentedTypes: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["All", "Cryptocoins", "Commodities", "Fiats"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    init(vm: CriptosViewModelProtocol) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewModel.view = self
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "Cryptos"
        viewModel.fetchData(filter: nil)
    }
}

extension CriptosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.criptoData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CriptoTableViewCell.cellId, for: indexPath) as? CriptoTableViewCell else { return UITableViewCell() }
        guard let data = viewModel.criptoData?[indexPath.row] else { return UITableViewCell() }
        cell.configureView(data: data)
        return cell
    }
}

extension CriptosViewController: CriptosViewProtocol {
    func refresh() {
        tableview.reloadData()
    }
}

private extension CriptosViewController {
    func addViews() {
        view.addSubview(segmentedTypes)
        view.addSubview(tableview)
        makeConstraints()
    }
    
    func makeConstraints() {
        segmentedTypes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        segmentedTypes.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        segmentedTypes.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        segmentedTypes.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: segmentedTypes.bottomAnchor, constant: 10).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        switch sender.selectedSegmentIndex {
        case 1:
            viewModel.fetchData(filter: .cryptocoin)
        case 2:
            viewModel.fetchData(filter: .commodity)
        case 3:
            viewModel.fetchData(filter: .fiat)
        default:
            viewModel.fetchData(filter: nil)
        }
    }
}
