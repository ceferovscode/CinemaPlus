//
//  MovelistController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import UIKit
import JGProgressHUD

class MovelistController: UIViewController {
    
    @IBOutlet private weak var listTableView: UITableView!
    
    private let refreshController = UIRefreshControl()
    private var viewModel = MoveListViewModel()
    private let cellId = "\(MoveListCell.self)"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureUI()
        confiqureViewModel()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listTableView.contentSize.height = 1000
    }
    
    private func configureUI() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        listTableView.refreshControl = refreshController
        listTableView.refreshControl?.tintColor = .purple
    }
    
    private func confiqureViewModel() {
        refreshController.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getMovieDetails()
        }
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.listTableView.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        listTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getMovieDetails()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension MovelistController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MoveListCell
        cell.confiqure(data: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.row)
    }
    
    
}
