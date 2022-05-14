//
//  ProductDetailVC.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/14.
//

import UIKit

class ProductDetailVC: UIViewController {

    private let product: Product
    
    init(product: Product){
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }

}
