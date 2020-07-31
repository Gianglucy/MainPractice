//
//  MovieFourthVC.swift
//  MainPractice
//
//  Created by Apple on 7/31/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class MovieFourthVC: UIViewController {
    
    var data:[Movie] = []
    
    @IBOutlet weak var tblMovie: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupUI()
    }
    
    func requestData() {
        var request = URLRequest(url: URL(string: ServerPath.API_URL.rawValue)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data,
                let _ = response as? HTTPURLResponse,
                error == nil else {
                    print("error111111111111",error ?? "ko xac dinh")
                    return
            }
            let movieData = try? JSONDecoder().decode(DataMovie.self, from: data)
            self.data = movieData?.results as! [Movie]
            DispatchQueue.main.async {
                self.tblMovie.reloadData()
            }
        }
        task.resume()
    }
    
    func setupUI() {
        tblMovie.delegate = self
        tblMovie.dataSource = self
        
        tblMovie.register(UINib(nibName: "MovieTblCell", bundle: nil), forCellReuseIdentifier: "MovieTblCell")
    }
}

extension MovieFourthVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMovie.dequeueReusableCell(withIdentifier: "MovieTblCell", for: indexPath) as! MovieTblCell
        if indexPath.row == data.count - 1 {
            cell.configCell(movie: data[indexPath.row], isLast: true)
        } else {
            cell.configCell(movie: data[indexPath.row])
        }
        return cell
    }
}
