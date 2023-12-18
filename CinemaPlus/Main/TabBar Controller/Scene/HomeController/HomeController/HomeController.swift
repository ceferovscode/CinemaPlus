//
//  HomeController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet private weak var homeCollection: UICollectionView!
    
    private var viewModel = HomeViewModel()
    private let cellId = "\(HomeCell.self)"
    private let refreshController = UIRefreshControl()
    private var coordinator: HomeCoordinator?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        confiqureViewModel()
        CustomCollectionView()
    }
    
    private func CustomCollectionView() {
        homeCollection.isPagingEnabled = true
        homeCollection.showsHorizontalScrollIndicator = false
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
    }
   
    private func configureUI() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        homeCollection.refreshControl = refreshController
        homeCollection.refreshControl?.tintColor = .purple
        homeCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func confiqureViewModel() {
        refreshController.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getPopularMovie()
        }
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.homeCollection.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        homeCollection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getPopularMovie()
        }
    }
}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.confiqure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.showMovieDetails(movieId: viewModel.items[indexPath.row].id ?? 0)
    }
    
    
}


