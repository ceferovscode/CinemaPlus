//
//  GenreController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.12.2023.
//

import UIKit
import JGProgressHUD

class GenreController: UIViewController {

    @IBOutlet private weak var genreTableView: UITableView!
    
    private var viewModel = GenreViewModel()
    private let cellId = "\(GenreCell.self)"
    private let refreshController = UIRefreshControl()


    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        progressTimer()
        confiqureViewModel()
        
        
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
    
   
    
    private func configureTableView() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        genreTableView.refreshControl = refreshController
        genreTableView.refreshControl?.tintColor = .purple
     
    }
    
    private func confiqureViewModel() {
        refreshController.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getMoviesGenres()
        }
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.genreTableView.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        genreTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getMoviesGenres()
        }
    }
    
    @IBAction func genreClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
   
}


extension GenreController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreTableView.dequeueReusableCell(withIdentifier: cellId) as! GenreCell
        cell.confiqure(data: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
