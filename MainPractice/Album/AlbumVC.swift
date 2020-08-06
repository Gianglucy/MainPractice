//
//  AlbumVC.swift
//  MainPractice
//
//  Created by Apple on 8/6/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
import Photos

class AlbumVC: UIViewController {
    
    @IBOutlet weak var tblAlbum: UITableView!
    var image =  [UIImage]()
    var imageAssets = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGallaryData()
        setupUI()
    }
    
    func setupUI() {
        tblAlbum.delegate = self
        tblAlbum.dataSource = self
        tblAlbum.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
    }
    
    func fetchGallaryData(){
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == .denied || status == .restricted) {
            return
        }else{
            PHPhotoLibrary.requestAuthorization { (authStatus) in
                if authStatus == .authorized{
                    let imageAsset = PHAsset.fetchAssets(with: .image, options: nil)
                    for index in 0..<imageAsset.count{
                        self.imageAssets.append(imageAsset[index])
                        DispatchQueue.main.async {
                            self.tblAlbum.reloadData()
                        }
                    }
                }
                
            }
        }
        
    }
    
}

extension AlbumVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageAssets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblAlbum.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        print(imageAssets[indexPath.row])
        cell.configCell(asset: imageAssets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
