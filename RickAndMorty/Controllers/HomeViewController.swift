//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        configureCollectionView()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.delegate = self
    }
    
    private func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 4
        let minimumItemSpacing: CGFloat = 4
        let availableWidth = width - (padding * 3) - (minimumItemSpacing * 3)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 60)
        
        return flowLayout
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

