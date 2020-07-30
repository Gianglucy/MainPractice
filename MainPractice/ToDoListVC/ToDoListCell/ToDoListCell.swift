//
//  ToDoListCell.swift
//  MainPractice
//
//  Created by Apple on 7/21/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit
protocol ToDoListCellDelegate {
    func tapButton(cell: ToDoListCell)
}
class ToDoListCell: UITableViewCell {

    @IBOutlet weak var imgTask: UIImageView!
    @IBOutlet weak var btnComplete: UIButton!
    @IBOutlet weak var lblTaskName: UILabel!
    var delegate: ToDoListCellDelegate?
//    let closureAAA : (dsdsdsds) => ()
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
//        let aaaa = aaa(dai: 1000, rong: 100)
//        aaaa.dai
//        aaaa.chuvi
    }
//    func aaa(dai: Int, rong: Int) -> (dai: Int, rong: Int, chuvi: Int) {
//        return (dai, rong, (dai+rong)*2)
//    }
    func setupUI() {
        self.btnComplete.addTarget(self, action: #selector(actionForButton), for: .touchUpInside)
        imgTask.contentMode = .scaleAspectFill
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgTask?.image = nil
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//
    func configCell(dataTask: Task) {
        let imageComplete = UIImage(systemName: "checkmark.circle.fill", withConfiguration: .none)
        let imageUnComplete = UIImage(systemName: "checkmark.circle", withConfiguration: .none)
//        let imagePlus = UIImage(systemName: "plus", withConfiguration: .none)
        
//        imgTa
        self.lblTaskName.text = dataTask.name
        
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: dataTask.pathURL!)
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self!.imgTask.image = UIImage(data: data)
                }
            } catch {
                
            }
        }
        
        if dataTask.isComplete! {
            self.btnComplete.setImage(imageComplete, for: .normal)
        } else {
            self.btnComplete.setImage(imageUnComplete, for: .normal)
        }
    }

    @objc func actionForButton() {
        self.delegate?.tapButton(cell: self)
    }
    
    //request toan bo image data trong background
    //lay duoc image thi update ui bang main thread
}
