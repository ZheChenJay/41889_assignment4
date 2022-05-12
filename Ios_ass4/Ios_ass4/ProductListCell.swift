//
//  ProductListCell.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/9.
//

import UIKit

class ProductListCell: UITableViewCell {

    private var coverView: UIImageView!
    private var nameLabel: UILabel!
    private var ratingView: UIView!
    private var priceLabel: UILabel!
    private var collectButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none //cell can not be select
        
        let hStack = UIStackView() //Horizontal stack view
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.spacing = 8
        hStack.alignment = .center
        contentView.addSubview(hStack)
        
        coverView = UIImageView()
        coverView.contentMode = .scaleAspectFit // Keep the width to height ratio of the original image and constrain the image to not exceed the uiImageView range
        hStack.addArrangedSubview(coverView) //add coverview into stackview
        
        //setting constraint of stackview and coverView
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5), //if use autolayout 
            coverView.widthAnchor.constraint(equalToConstant: 100),
            coverView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 6
        hStack.addArrangedSubview(vStack)
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        vStack.addArrangedSubview(nameLabel)
        
        ratingView = UIView()
        ratingView.backgroundColor = .systemOrange
        vStack.addArrangedSubview(ratingView)
        
        //临时约束ratingView 做好星号的时候可以移除，暂时用于占位置
        NSLayoutConstraint.activate([
            ratingView.widthAnchor.constraint(equalToConstant: 100),
            ratingView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let priceHstack = UIStackView()
        vStack.addArrangedSubview(priceHstack)
        
        priceLabel = UILabel()
        priceLabel.font = .boldSystemFont(ofSize: 24)
        priceLabel.textColor = .systemPink
        priceHstack.addArrangedSubview(priceLabel)
        
        collectButton = UIButton()
        collectButton.tintColor = .systemRed
        collectButton.setImage(UIImage(systemName: "heart"), for: .normal)
        collectButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        priceHstack.addArrangedSubview(collectButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCover(_ cover: String){
        coverView.image = UIImage(systemName: "heart.fill")
    }
    
    func setName(_ name: String){
        nameLabel.text = name
    }
    
    func setPrice(_ price: Double){
        priceLabel.text = String(format: "$%.2f",price)
    }
    
    func setCollect(_ collect:Bool){
        collectButton.isSelected = collect
    }
}
