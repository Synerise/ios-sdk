//
//  CheckoutViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class CheckoutViewController: DefaultViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCartView: UIView!
    
    var viewModel: CheckoutViewModel = CheckoutViewModel()
    
    // MARK: - IBAction
    
    @IBAction func placeOrderButtonWasTapped(_ sender: DefaultButton) {
        viewModel.coordinator?.placeYourOrderButtonWasTapped()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        prepareLeftMenuButton()
        registerCells()
    }
    
    // MARK: - Private
    
    private func getViewModel(indexPath: IndexPath) -> AnyObject {
        let section = indexPath.section
        let row = indexPath.row
        let model = viewModel.sections[section].rows[row]
        
        return model
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: CheckoutVoucherTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CheckoutVoucherTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CheckoutProductTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CheckoutProductTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CheckoutShipToTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CheckoutShipToTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CheckoutShippingMethodTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CheckoutShippingMethodTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CheckoutPaymentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CheckoutPaymentTableViewCell.reuseIdentifier)
    }
    
    private func updateScene(indexPath: IndexPath) {
        if CartManager.shared.isEmpty() {
            viewModel.coordinator?.showCartIsEmptyView()
        } else {
            updateTableView(indexPath: indexPath)
        }
    }
    
    private func updateTableView(indexPath: IndexPath) {
        viewModel.loadSections()
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
    }
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? true : false
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        CartManager.shared.removeProduct(row: indexPath.row)
        updateScene(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getTitleForSection(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = getViewModel(indexPath: indexPath)
        
        switch model {
        case is CheckoutPaymentTableViewModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutPaymentTableViewCell.reuseIdentifier) as? CheckoutPaymentTableViewCell {
                cell.delegate = self
                cell.update(model)
                
                return cell
            }
        case is CheckoutShippingMethodTableViewModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutShippingMethodTableViewCell.reuseIdentifier) as? CheckoutShippingMethodTableViewCell {
                cell.delegate = self
                cell.update(model)
                
                return cell
            }
        case is CheckoutShipToTableViewModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutShipToTableViewCell.reuseIdentifier) as? CheckoutShipToTableViewCell {
                cell.update(model)
                
                return cell
            }
        case is CheckoutProductTableViewModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutProductTableViewCell.reuseIdentifier) as? CheckoutProductTableViewCell {
                cell.update(model)
                
                return cell
            }
        case is CheckoutVoucherTableViewModel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutVoucherTableViewCell.reuseIdentifier) as? CheckoutVoucherTableViewCell {
                cell.update(model)
                
                return cell
            }
        
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}

extension CheckoutViewController: CheckoutPaymentTableViewCellDelegate, CheckoutShippingMethodTableViewCellDelegate {
    
    func controlButtonValueWasChanged(_ cell: CheckoutShippingMethodTableViewCell) {
        guard let selectedShippingMethodRow = tableView.indexPath(for: cell)?.row else { return }
        viewModel.selectedShippingMethod = selectedShippingMethodRow - 1
        tableView.reloadData()
    }
    
    func checkboxButtonValueChanged(_ cell: CheckoutPaymentTableViewCell) {
        guard let selectedPaymentMethodRow = tableView.indexPath(for: cell)?.row else { return }
        viewModel.selectedPaymentMethod = selectedPaymentMethodRow
        tableView.reloadData()
    }
}
