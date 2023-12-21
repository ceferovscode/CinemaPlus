//
//  NameController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 20.12.2023.
//

import UIKit

class NameController: UIViewController {
    
    @IBOutlet private weak var nameCollectionView: UICollectionView!
    
    
    private var viewModel = NameViewModel()
    private let cellId = "\(NameCell.self)"
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        confiqureViewModel()
        configureCell()
        
    }
    private func configureCell() {
        nameCollectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func configureUI() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        nameCollectionView.refreshControl = refreshController
        nameCollectionView.refreshControl?.tintColor = .black
    }
    
    private func confiqureViewModel() {
        refreshController.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getMovieName()
        }
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.nameCollectionView.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        nameCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getMovieName()
        }
    }
}


extension NameController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nameCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NameCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: nameCollectionView.frame.width, height: nameCollectionView.frame.height)
        }
    
    
    
}


