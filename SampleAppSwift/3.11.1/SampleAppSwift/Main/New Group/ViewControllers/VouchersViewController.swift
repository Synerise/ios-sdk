//
//  VocuhersViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class VouchersViewController: DefaultViewController {
    
    @IBOutlet var refreshButton: DefaultButton!
    @IBOutlet var listTableView: UITableView!
    
    private var vouchers: [String] = [String]() {
        didSet {
            self.listTableView.isScrollEnabled = (vouchers.count > 0)
            self.listTableView.reloadData()
        }
    }
    
    // MARK: - IBAction
    
    @objc func refreshButtonTapped() {
        self.getOrAssignVouchers {
            self.getAssignedVouchers()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareLeftMenuButton()
        
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        self.refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.isScrollEnabled = false
        self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func getOrAssignVouchers(completion: @escaping (()->())) {
        let poolUUIDs = ["0852547b-a6d1-438e-b5f3-d5af4f7dd9de", "3c28ffcb-499a-4397-a2de-e644a35f1c3d", "faec32b0-c343-4362-ba32-c6148c649da4"]
        
        self.showLoading()
        
        let semaphore = DispatchSemaphore(value: poolUUIDs.count)
        for poolUUID in poolUUIDs {
            Promotions.getOrAssignVoucher(poolUUID: poolUUID, success: { assignVoucherResponse in
                semaphore.signal()
            }) { (error) in
                semaphore.signal()
            }
        }
        semaphore.wait()
        
        self.hideLoading()
        completion()
    }
    
    private func assignVouchers(completion: @escaping (()->())) {
        self.showLoading()
        
        Promotions.assignVoucherCode(poolUUID: "0852547b-a6d1-438e-b5f3-d5af4f7dd9de", success: { assignVoucherResponse in
            self.hideLoading()
            completion()
        }) { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    private func getAssignedVouchers() {
        self.showLoading()
        
        Promotions.getAssignedVoucherCodes(success: { voucherCodesResponse in
            var vouchers: [String] = [String]()
            voucherCodesResponse.items.forEach({ (voucherCodesData) in
                if voucherCodesData.status == .assigned {
                    vouchers.append("CODE: " + voucherCodesData.code + " EXPIRATION: " + (voucherCodesData.expireIn?.description ?? ""))
                }
            })
            
            self.hideLoading()
            self.vouchers = vouchers
        }) { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
}

extension VouchersViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(self.vouchers.count, 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.listTableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError()
        }
        
        if vouchers.count == 0 {
            cell.textLabel?.text = "There are no assigned vouchers yet"
            return cell
        }
        
        cell.textLabel?.text = self.vouchers[indexPath.row]
        
        return cell
    }
}
