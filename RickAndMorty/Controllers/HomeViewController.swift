//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var characters = [RMCharacter]()
    var pageNumber = 1
    var pageHasMoreCharacters = true
    
    //MARK: - SETUP VIEW CONTROLLER
    override func viewDidLoad() {
        fetchCharacters(pageNum: pageNumber)
        super.viewDidLoad()
        setupViewController()
        configureCollectionView()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - SETUP COLLECTION VIEW

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 12
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    //MARK: - SETUP FETCH DATA METHOD
    
    private func fetchCharacters(pageNum: Int) {
        NetworkManager.shared.getCharactersFromAPI(endpoint: "character", page: pageNum) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let res):
                if res.results.count < 20  { self.pageHasMoreCharacters = false }
                self.characters.append(contentsOf: res.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        DispatchQueue.main.async { self.collectionView.reloadData() }
    }
    
}

    //MARK: - EXTENSIONS

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        cell.set(character: characters[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            showLoadingView()
            guard pageHasMoreCharacters else { return }
            pageNumber += 1
            fetchCharacters(pageNum: pageNumber)
            dismissLoadingView()
        }
    }
}



