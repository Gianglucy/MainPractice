//
//  NewsVC.swift
//  MainPractice
//
//  Created by Apple on 8/3/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    
    var data: [News]?
    var passID: ((_ id: String) ->())?
    
    @IBOutlet weak var tblNews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestData()
    }
    
    func setupUI() {
        
        tblNews.delegate = self
        tblNews.dataSource = self
        
        tblNews.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
    func requestData() {
        var request = URLRequest(url: URL(string: ServerPath.LOCAL_HOST.rawValue + "/listNewsMobile")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data,
                let _ = response as? HTTPURLResponse,
                error == nil else {
                    print("error111111111111",error ?? "ko xac dinh")
                    return
            }
            let newsData = try? JSONDecoder().decode(DataNews.self, from: data)
            guard let result = newsData?.data else { return }
            self.data = result
            DispatchQueue.main.async {
                self.tblNews.reloadData()
            }
        }
        task.resume()
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNews.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        guard let data = self.data else { return cell }
        cell.configCell(news: data[indexPath.row])
        cell.delegate = self
        cell.closure = {
            if let id = data[indexPath.row].id {
                self.passID?(id)
            }
        }
        return cell
    }
}

extension NewsVC: NewsCellDelegate{
    func passingDataNews(data: News) {
        let newsDetailVC = NewsDetailVC(nibName: "NewsDetailVC", bundle: nil)
        self.navigationController?.pushViewController(newsDetailVC, animated: false)
        newsDetailVC.dataNews = data
    }
}
