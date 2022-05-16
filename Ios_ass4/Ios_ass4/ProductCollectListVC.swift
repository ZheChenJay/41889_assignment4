//
//  ProductCollectListVC.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/16.
//

import UIKit

class ProductCollectListVC: ProductListVC {

    override func setupRefreshHeader() {}

    override func refreshData() {
        list = ProductCollectManager.shared.list
        if tableView != nil {tableView.reloadData()}
    }
}
