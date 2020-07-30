//
//  ToDoListVC.swift
//  MainPractice
//
//  Created by Apple on 7/21/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class ToDoListVC: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var tblTask: UITableView!
    //tableviewTask, tbvTask
    var dataTask:[Task] = [
        Task(name: "task1", isComplete: false, pathURL: nil),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVe9MTykEtqxfn_brjx0v9Kw70u4V5Gr-fSQ&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQNtV805iL9SO0C2HO9iyFYZqCCVTXm4QTG-g&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZHgyaH4b3z0i2VMAORqEmB_8g7Fmzu5zisA&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVe9MTykEtqxfn_brjx0v9Kw70u4V5Gr-fSQ&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQNtV805iL9SO0C2HO9iyFYZqCCVTXm4QTG-g&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZHgyaH4b3z0i2VMAORqEmB_8g7Fmzu5zisA&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVe9MTykEtqxfn_brjx0v9Kw70u4V5Gr-fSQ&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQNtV805iL9SO0C2HO9iyFYZqCCVTXm4QTG-g&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQNtV805iL9SO0C2HO9iyFYZqCCVTXm4QTG-g&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZHgyaH4b3z0i2VMAORqEmB_8g7Fmzu5zisA&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVe9MTykEtqxfn_brjx0v9Kw70u4V5Gr-fSQ&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQNtV805iL9SO0C2HO9iyFYZqCCVTXm4QTG-g&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZHgyaH4b3z0i2VMAORqEmB_8g7Fmzu5zisA&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVe9MTykEtqxfn_brjx0v9Kw70u4V5Gr-fSQ&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReGY3cg1ivp5fwTM3Dd_ThJhVDyCoDozcHBw&usqp=CAU"),
        Task(name: "task1", isComplete: false, pathURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Ys3cOqJ5zAfFUVXkK1TXRGEchf93bM41Ow&usqp=CAU")
    ]
    
    var taskInput:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTask.delegate = self
        tblTask.dataSource = self
        tblTask.register(UINib(nibName: "ToDoListCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tblTask.estimatedRowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit Task", message: "Please fill", preferredStyle: .alert)
        alert.addTextField { (textField) -> Void in
            textField.text = self.dataTask[indexPath.row].name
            textField.delegate = self //REQUIRED
            textField.placeholder = "Enter your task name"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            print(self.taskInput!)
            self.dataTask[indexPath.row].name = self.taskInput!
            self.tblTask.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func addTask (sender:UIButton){
        let alert = UIAlertController(title: "Add Task", message: "Please fill", preferredStyle: .alert)
        
        alert.addTextField { (textField) -> Void in
            textField.delegate = self //REQUIRED
            textField.placeholder = "Enter your task name"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            print(self.taskInput!)
            self.dataTask.append(Task(name: self.taskInput!, isComplete: false))
            self.tblTask.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.taskInput = textField.text
    }
    
    // MARK:Delete item
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tblTask.beginUpdates()
            dataTask.remove(at: indexPath.row)
            tblTask.deleteRows(at: [indexPath], with: .fade)
            tblTask.endUpdates()
        }
    }
}

extension ToDoListVC:UITableViewDelegate {
    
}

extension ToDoListVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTask.dequeueReusableCell(withIdentifier: "Cell") as! ToDoListCell
        cell.delegate = self
        let imagePlus = UIImage(systemName: "plus", withConfiguration: .none)
        if indexPath.row == 0 {
            cell.lblTaskName.text = nil
            cell.btnComplete.setImage(imagePlus, for: .normal)
            cell.btnComplete.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        } else{
            cell.configCell(dataTask: dataTask[indexPath.row])
            cell.delegate?.tapButton(cell: cell)
        }
        return cell
    }
}

extension ToDoListVC: ToDoListCellDelegate {
    func tapButton(cell: ToDoListCell) {
        guard let indexPath = tblTask.indexPath(for: cell)  else {
            return
        }
        dataTask[indexPath.row].isComplete = !dataTask[indexPath.row].isComplete!
        tblTask.reloadData()
    }
}
