//
//  ViewController.swift
//  SampleTableViewCellMove
//
//  Created by Tomoya Matsuyama on 2018/03/03.
//  Copyright © 2018年 Tomoya Matsuyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var cellItemLists = ["サンプル１", "サンプル２", "サンプル３", "サンプル４","サンプル５", "サンプル６"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationBarのボタンを編集ボタンに設定。
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceCellItem = cellItemLists[sourceIndexPath.row]
        guard let indexPath = cellItemLists.index(of: sourceCellItem) else { return }
        cellItemLists.remove(at: indexPath)
        cellItemLists.insert(sourceCellItem, at: destinationIndexPath.row)
    }
}

//DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItemLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        cell.textLabel?.text = cellItemLists[indexPath.row]
        return cell
    }
}
