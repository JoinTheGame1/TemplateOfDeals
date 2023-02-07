import UIKit

class DealsViewController: UIViewController {
    
    private let server = Server()
    private var deals: [Deal] = []
    private var buttons: [SortButton] = []
    
    lazy var instrumentSortButton = makeSortButton(
        sortType: .instrument,
        title: SortButtonTitle.instrument,
        titleAlignment: .leading
    )
    lazy var priceSortButton = makeSortButton(sortType: .price, title: SortButtonTitle.price)
    lazy var amountSortButton = makeSortButton(sortType: .amount, title: SortButtonTitle.amount)
    lazy var sideSortButton = makeSortButton(sortType: .side, title: SortButtonTitle.side)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [
            instrumentSortButton,
            priceSortButton,
            amountSortButton,
            sideSortButton
        ]
        setupUI()
        setupConstraints()
        server.subscribeToDeals { deals in
            self.deals.append(contentsOf: deals)
            self.tableView.reloadData()
        }
        self.deals.sort(by: { $0.dateModifier > $1.dateModifier } )
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DealCell.self, forCellReuseIdentifier: DealCell.identifier)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = Constants.navigationBarTitle
        
        view.addSubview(instrumentSortButton)
        view.addSubview(priceSortButton)
        view.addSubview(amountSortButton)
        view.addSubview(sideSortButton)
        
        instrumentSortButton.delegate = self
        priceSortButton.delegate = self
        amountSortButton.delegate = self
        sideSortButton.delegate = self
        
        configureTableView()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            instrumentSortButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            instrumentSortButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            instrumentSortButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.35),
            instrumentSortButton.heightAnchor.constraint(equalToConstant: 40),
            
            priceSortButton.topAnchor.constraint(equalTo: instrumentSortButton.topAnchor),
            priceSortButton.leadingAnchor.constraint(equalTo: instrumentSortButton.trailingAnchor, constant: 4),
            priceSortButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.17),
            priceSortButton.heightAnchor.constraint(equalTo: instrumentSortButton.heightAnchor),
            
            amountSortButton.topAnchor.constraint(equalTo: instrumentSortButton.topAnchor),
            amountSortButton.leadingAnchor.constraint(equalTo: priceSortButton.trailingAnchor, constant: 4),
            amountSortButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.26),
            amountSortButton.heightAnchor.constraint(equalTo: instrumentSortButton.heightAnchor),
            
            sideSortButton.topAnchor.constraint(equalTo: instrumentSortButton.topAnchor),
            sideSortButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            sideSortButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.15),
            sideSortButton.heightAnchor.constraint(equalTo: instrumentSortButton.heightAnchor),
            
            tableView.topAnchor.constraint(equalTo: instrumentSortButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension DealsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heightForRow
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? DealCell
        else { return }
        cell.configure(with: deals[indexPath.row])
    }
}

extension DealsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DealCell.identifier,
            for: indexPath
        ) as? DealCell
        else { return UITableViewCell() }
        
        return cell
    }
}

extension DealsViewController: SortButtonDelegate {
    func sortButtonPressed(_ sender: SortButton) {
        inactiveButtons(except: sender.sortType)

        switch sender.sortType {
        case .instrument:
            if sender.sortState == .ascending {
                deals.sort(by: { $0.instrumentName > $1.instrumentName })
            } else {
                deals.sort(by: { $0.instrumentName < $1.instrumentName })
            }
        case .price:
            if sender.sortState == .ascending {
                deals.sort(by: { $0.price > $1.price })
            } else {
                deals.sort(by: { $0.price < $1.price })
            }
        case .amount:
            if sender.sortState == .ascending {
                deals.sort(by: { $0.amount > $1.amount })
            } else {
                deals.sort(by: { $0.amount < $1.amount })
            }
        case .side:
            if sender.sortState == .ascending {
                deals.sort(by: { $0.side.hashValue > $1.side.hashValue })
            } else {
                deals.sort(by: { $0.side.hashValue < $1.side.hashValue })
            }
        }
        tableView.reloadData()
    }
    
    private func inactiveButtons(except: SortButtonType) {
        buttons.forEach { button in
            if button.sortType != except {
                button.inactive()
            }
        }
    }
}

extension DealsViewController {
    enum SortButtonTitle {
        static let instrument = "Instrument"
        static let price = "Price"
        static let amount = "Amount"
        static let side = "Side"
    }
    
    enum Constants {
        static let navigationBarTitle = "Deals"
        static let heightForRow: CGFloat = 52.0
    }
}
