//
//  ProductListVC.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/9.
//

import UIKit
import MJRefresh
import PKHUD

class ProductListVC: UIViewController {
    
    var list: [Product] = []
    
    private var tableView:UITableView!
    
    private var subscribeKey: String = ""
    
    deinit { ProductCollectManager.shared.unsubscribe(subscribeKey) }
    override func viewDidLoad() {
        super.viewDidLoad()
         
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false // Automatic layout
        tableView.rowHeight = 110 // set cell height
        tableView.separatorStyle = .none // no separator line
        tableView.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.description()// register a cell
        )
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // automatic layout constraint
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo:view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo:view.rightAnchor),
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor)
        ])
        let header = MJRefreshNormalHeader{ [weak self] in // [weak self] aviod circular reference
            guard let self = self else { return }
            self.refreshData()
        }
        header.stateLabel?.isHidden = true
        header.lastUpdatedTimeLabel?.isHidden = true
        tableView.mj_header = header
        
        tableView.mj_header?.beginRefreshing()
        
        subscribeKey = ProductCollectManager.shared.subscribe{ [weak self] product in
            guard let self = self else { return }
            
            if let row = self.list.firstIndex(where: { $0.id == product.id}){
                self.tableView.reloadRows(at: [IndexPath(row: row, section:0)], with: .none)
            }
        }
    }
    func refreshData(){
        NetworkAPI.homeProductList { [weak self] result in // similar as MJ
            guard let self = self else { return }
            
            self.tableView.mj_header?.endRefreshing()
            
            switch result {
            case let .success(list):
                self.list = list
                self.tableView.reloadData()
            case let .failure(error):
                HUD.flash(.label(error.localizedDescription), delay: 5) // error pop
            }
        }
    }

}

extension ProductListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.description(), for: indexPath) as! ProductListCell

        
        // cell.textLabel?.text = indexPath.description
        cell.delegate = self
        cell.setCover(product.cover)
        cell.setName(product.name)
        cell.setRating(product.rating)
        cell.setPrice(product.price)
        cell.setCollect(true)
        cell.setCollect(ProductCollectManager.shared.checkCollect(product))
        return cell
    }
}

extension ProductListVC:UITableViewDelegate{ // uitabkeview agent
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = list[indexPath.row]
        let vc = ProductDetailVC(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductListVC: ProductListCellDelegate{
    func productListCellDidClickCollect(_ cell: ProductListCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let product = list[indexPath.row]
        ProductCollectManager.shared.collectProduct(product)

    }
}
