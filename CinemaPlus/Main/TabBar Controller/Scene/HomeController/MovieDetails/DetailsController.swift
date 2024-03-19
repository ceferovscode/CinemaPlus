//
//  DetailsController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 17.12.2023.
//

import UIKit
import JGProgressHUD

class DetailsController: UIViewController {
    
    @IBOutlet private weak var detailsCollection: UICollectionView!
    
    
    private let cellId = "\(DetailsCell.self)"
    let  viewModel = DetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()

    }
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    private func configureUI() {
        detailsCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func configureViewModel() {
        viewModel.getMovieDetails()
        viewModel.successCallback = {
            self.detailsCollection.reloadData()
        }
    }
    
}


extension DetailsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailsCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailsCell
        if let movie = viewModel.movie {
            cell.configureData(data: movie)
        } else {
            print("errorr")
        }
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemWidth = detailsCollection.bounds.width
            let itemHeight = detailsCollection.bounds.height
            return CGSize(width: itemWidth, height: itemHeight)
        }
}

