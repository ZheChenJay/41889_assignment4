//
//  ProductListVC.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/9.
//

import UIKit
import MJRefresh

class ProductListVC: UIViewController {
    
    var list: [Product] = []
    
    private var tableView:UITableView!
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
            tableView.topAnchor.constraint(equalTo:view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor)
        ])
        let header = MJRefreshNormalHeader{
            self.refreshData()
        }
        header.stateLabel?.isHidden = true
        header.lastUpdatedTimeLabel?.isHidden = true
        tableView.mj_header = header
        
        tableView.mj_header?.beginRefreshing()
    }
    func refreshData(){
        NetworkAPI.homeProductList { result in
            
            self.tableView.mj_header?.endRefreshing()
            
            switch result {
            case let .success(list):
                self.list = list
                self.tableView.reloadData()
            case let .failure(error): print("fail: \(error.localizedDescription)")
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
        
        cell.setCover("")
        cell.setName(product.name)
        cell.setRating(product.rating)
        cell.setPrice(product.price)
        cell.setCollect(true)
        return cell
    }
}

extension ProductListVC:UITableViewDelegate{ // uitabkeview agent
    
}
