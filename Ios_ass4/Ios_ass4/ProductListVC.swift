//
//  ProductListVC.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/9.
//

import UIKit
import MJRefresh

class ProductListVC: UIViewController {
    
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
            print("refresh") //test refresh
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.tableView.mj_header?.endRefreshing()
            }
        }
        header.stateLabel?.isHidden = true
        header.lastUpdatedTimeLabel?.isHidden = true
        tableView.mj_header = header
    }


}

extension ProductListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.description(), for: indexPath) as! ProductListCell

        
        // cell.textLabel?.text = indexPath.description
        
        cell.setCover("")
        if indexPath.row % 2 == 0{
            cell.setName("Name")
            cell.setRating(3)
            cell.setPrice(100)
            cell.setCollect(true)
        }else{
            cell.setName(String(repeating:"Name ", count:20))
            cell.setRating(4)
            cell.setPrice(1234567.123)
            cell.setCollect(false)
        }
        return cell
    }
}

extension ProductListVC:UITableViewDelegate{ // uitabkeview agent
    
}
