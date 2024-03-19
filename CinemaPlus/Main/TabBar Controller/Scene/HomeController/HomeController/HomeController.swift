//
//  HomeController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import UIKit
import JGProgressHUD

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
        progressTimer()
    }
    
    private func progressTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {self.showExample()
        })
    }
    
   
    private func showExample() {
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDIndicatorView()
        hud.textLabel.text = "Dowloading"
        hud.detailTextLabel.text = "0%"
        hud.tintColor? = .purple
        hud.show(in: view)
        
        var progress: Float = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += 0.1
            hud.setProgress(progress, animated: true)
            let value: Float = progress / 1.0
            hud.detailTextLabel.text = "\(Int(value * 100.0))%"
            if progress > 1.0 {
                timer.invalidate()
                
                hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                hud.detailTextLabel.text = nil
                hud.textLabel.text = "Success!"
                hud.dismiss(afterDelay: 2)
            }
        }
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
    
    @IBAction func genreClicked(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {self.showExample()
        })
        
        coordinator?.showMoviesGenre()
    }
    
    @IBAction func topClicked(_ sender: Any) {
    }
    
    @IBAction func languageClicked(_ sender: Any) {
    }
    
    @IBAction func watchedClicked(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {self.showExample()
        })
        
        coordinator?.showVideoList()
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


