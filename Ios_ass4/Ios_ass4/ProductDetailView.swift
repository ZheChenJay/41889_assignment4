//
//  ProductDetailView.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/15.
//

import UIKit

class ProductDetailView: UIView {
    
    private var cycleview: CycleView!
    private var nameLabel: UILabel!
    private var ratingView: RatingView!
    private var priceLabel: UILabel!
    private var collectButton: UIButton!
    private var vStack: UIStackView!

    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        cycleview = CycleView()
        addSubview(cycleview)
        
        NSLayoutConstraint.activate([
            cycleview.leftAnchor.constraint(equalTo: leftAnchor),
            cycleview.rightAnchor.constraint(equalTo: rightAnchor),
            cycleview.topAnchor.constraint(equalTo: topAnchor),
            cycleview.heightAnchor.constraint(equalTo: cycleview.widthAnchor),
        ])
        
        vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.alignment = .leading
        vStack.axis = .vertical
        vStack.spacing = 6
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            vStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            vStack.topAnchor.constraint(equalTo: cycleview.bottomAnchor, constant: 10),

        ])
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        vStack.addArrangedSubview(nameLabel)
        
        ratingView = RatingView()
        vStack.addArrangedSubview(ratingView)
        
        let hStack = UIStackView()
        vStack.addArrangedSubview(hStack)
        
        priceLabel = UILabel()
        priceLabel.font = .boldSystemFont(ofSize: 24)
        priceLabel.textColor = .systemOrange
        hStack.addArrangedSubview(priceLabel)
        
        collectButton = UIButton()
        collectButton.tintColor = .systemRed
        collectButton.setImage(UIImage(systemName: "heart"), for: .normal)
        collectButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        hStack.addArrangedSubview(collectButton)
        
        collectButton.setContentHuggingPriority(.required, for: .horizontal) // aviod tensile
        collectButton.rightAnchor.constraint(equalTo: vStack.rightAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {  //Setting the layout manually
        super.layoutSubviews()
        frame.size.height = vStack.frame.maxY + 10
    }
    
    func setimages(_ images:[String]){
        cycleview.setImage(images)
    }
    
    func setName(_ name: String){
        nameLabel.text = name
    }
    
    func setRating(_ rating: Int){
        ratingView.rating = rating
    }
    
    func setPrice(_ price: Double){
        priceLabel.text = String(format: "$%.2f",price)
    }
    
    func setCollect(_ collect:Bool){
        collectButton.isSelected = collect
    }
    
}
