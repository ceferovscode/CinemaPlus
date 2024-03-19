//
//  VideoController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import UIKit
import Alamofire

class VideoController: UIViewController {
    
    @IBOutlet weak var videTableView: UITableView!
    let apiKey =    "0352d5121fca155df4ba7b0f29b4e4aa"
    var viewModel: VideoViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = VideoViewModel(apiKey: apiKey)
        viewModel.fetchVideoData {
            DispatchQueue.main.async {
                self.videTableView.reloadData()
            }
        }
    }
}

extension VideoController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        let video = viewModel.videos[indexPath.row]
        cell.textLabel?.text = video.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = viewModel.videos[indexPath.row]
        let urlString = "https://www.youtube.com/watch?v=\(video.key)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
