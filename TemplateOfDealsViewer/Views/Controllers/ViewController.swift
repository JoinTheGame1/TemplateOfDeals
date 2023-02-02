//import UIKit
//
//class ViewController: UIViewController {
//    private let server = Server()
//    private var deals: [Deal] = []
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = "Deals"
//
//        tableView.register(UINib(nibName: DealCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: DealCell.reuseIdentifier)
//        tableView.register(UINib(nibName: HeaderCell.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderCell.reuseIdentifier)
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        server.subscribeToDeals { deals in
//            self.deals.append(contentsOf: deals)
//            self.tableView.reloadData()
//        }
//    }
//}
//
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        deals.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: DealCell.reuseIdentifier, for: indexPath) as? DealCell
//        else { return UITableViewCell() }
//        cell.configure(with: deals[indexPath.row])
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.reuseIdentifier) as? HeaderCell
//        else { return UITableViewCell() }
//
//        return cell
//    }
//    //  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    //    return 60
//    //  }
//}
//
