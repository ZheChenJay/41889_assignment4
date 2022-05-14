//
//  ProductDetailVC.swift
//  Ios_ass4
//
//  Created by HongYueyang on 2022/5/14.
//

import UIKit

class ProductDetailVC: UIViewController {

    private let product: Product
    
    private var detailView: ProductDetailView!
    private var tableView: UITableView!
    
    init(product: Product){
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CommentListCell.self, forCellReuseIdentifier: CommentListCell.description())
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        detailView = ProductDetailView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 0))
        detailView.setimages(product.images)
        detailView.setName(product.name)
        detailView.setRating(product.rating)
        detailView.setPrice(product.price)
        detailView.setCollect(true)
        detailView.layoutIfNeeded()
        tableView.tableHeaderView = detailView
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
    }

}

extension ProductDetailVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentListCell.description(), for: indexPath)
            as! CommentListCell
        
// fake comment
        if indexPath.row % 2 == 0 {
        cell.setAvatar("person.circle.fill")
        cell.setName("Mark")
        cell.setRating(4)
        cell.setContent("so GOOOOOOOOOOOD")
        }else{
        cell.setAvatar("person.2.circle.fill")
        cell.setName("Jack family")
        cell.setRating(5)
            cell.setContent(String(repeating:"That wonderful!!!!!!!!!!!!", count: 5))
            }
        return cell
    }
}

extension ProductDetailVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
}
