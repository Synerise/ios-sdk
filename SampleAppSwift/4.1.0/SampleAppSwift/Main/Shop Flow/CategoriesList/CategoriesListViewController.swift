//
//  CategoriesListViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CategoriesListViewController: DefaultViewController {
    
    var viewModel: CategoriesListViewModel!
    
    let rowHeight: CGFloat = 200.0
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareRightCartButton()
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CategoryItemTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CategoryItemTableViewCell.reuseIdentifier)
        self.navigationItem.title = viewModel.sectionModel.sectionName
    }
}

extension CategoriesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        viewModel.categoryWasSelected(index: index)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemTableViewCell.reuseIdentifier) as? CategoryItemTableViewCell else {
               fatalError("Cannot dequeue cell")
        }
        let index = indexPath.row
        let itemViewModel = viewModel.getItemViewModel(index: index)
        cell.update(itemViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}
