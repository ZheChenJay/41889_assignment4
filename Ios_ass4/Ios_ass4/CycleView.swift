//
//  CycleView.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/15.
//

import UIKit

class CycleView: UIView {
    
    private var image: [String] = []
    private var collectionView: UICollectionView!
    private var pageControl: UIPageControl!
    private var multiplier = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout:  layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CycleViewCell.self, forCellWithReuseIdentifier: CycleViewCell.description())
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
                    
        pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ images: [String]){
        self.image = images
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        pageControl.numberOfPages = image.count
        scrollToCenter()
    }
    
    private func scrollToCenter(){
        collectionView.scrollToItem(at: IndexPath(item: multiplier / 2 * image.count, section: 0),
                                    at: .centeredVertically, animated: false)

    }
}

extension CycleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count * multiplier
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CycleViewCell.description(), for: indexPath) as! CycleViewCell
        cell.imageView.image = UIImage(systemName: "heart.fill")
        cell.imageView.sh_setImage(name: image[indexPath.item % image.count])
        return cell
    }
}

extension CycleView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int((scrollView.contentOffset.x + 5) / scrollView.bounds.width) % image.count
        pageControl.currentPage = index
        
        if index == 0 {
            scrollToCenter()
        }
    }
}


private class CycleViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
