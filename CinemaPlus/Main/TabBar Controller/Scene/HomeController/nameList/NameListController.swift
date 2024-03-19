//
//  NameListController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import UIKit

class NameListController: UIViewController {
    
    @IBOutlet private weak var nameTableView: UITableView!
    
    
    private let cellId = "\(NameListCell.self)"
    let  viewModel = NameListViewModel()
    private var coordinator: HomeCoordinator?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureCoordinator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nameTableView.contentSize.height = 1000
    }
    
    private func configureCoordinator() {
        coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    private func configureViewModel() {
        viewModel.getNameList()
        viewModel.successCallback = {
            self.nameTableView.reloadData()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension NameListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! NameListCell
        if let movie = viewModel.movie {
            cell.configureData(data: movie)
        } else {
            print("errorr")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        coordinator?.showVideo(videoId: viewModel.items[indexPath.row].key ?? "")
    }
}
