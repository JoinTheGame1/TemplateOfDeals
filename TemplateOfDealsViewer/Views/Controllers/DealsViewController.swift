import UIKit

class DealsViewController: UIViewController {
    
    private let server = Server()
    private var deals: [Deal] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationItem.title = "Deals"
        configureTableView()
        server.subscribeToDeals { deals in
            self.deals.append(contentsOf: deals)
            self.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
        tableView.register(DealCell.self, forCellReuseIdentifier: DealCell.identifier)
    }
}

extension DealsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
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
        
        cell.configure(with: deals[indexPath.row])
        return cell
    }
}
