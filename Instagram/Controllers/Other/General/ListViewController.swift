//
//  ListViewController.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 1/17/21.
//

import UIKit

class ListViewController: UIViewController {
    
    private let data: [String]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()
    init(data: [String]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
    }
    
    
    
}
