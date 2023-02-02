//
//  CustomEventViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class CustomEventViewController: DefaultViewController {
    
    var parameters: [CustomEventParameter] =  [CustomEventParameter]()
    let parametersTypes = [ParameterType.int, ParameterType.string, ParameterType.double]
    
    @IBOutlet weak var value: UITextField!
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var eventAction: UITextField!
    @IBOutlet weak var eventLabel: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: IBAction
    
    @IBAction func addButtonWasPressed(_ sender: DefaultButton) {
        insertNewParameter()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        setupProtocols()
        setupNavigationItem()
        self.hideKeyboardWhenTappedAround()
        pickerView.selectRow(1, inComponent: 0, animated: true)
    }
    
    // MARK: - Private
    
    @objc private func sendButtonWasPressed() {
        let parameters = makeParameters()
        guard let label = getItem(textField: eventLabel) else { return }
        guard let action = getItem(textField: eventAction) else { return }
        let event: CustomEvent = CustomEvent(label: label, action: action, params: parameters)
        Tracker.send(event)
        cleanData()
        UserInfoMessageManager.shared.success("Success", "Event was sent")
    }
    
    private func setupProtocols() {
        tableView.delegate = self
        tableView.dataSource = self
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: .done, target: self, action: #selector(sendButtonWasPressed))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.navigationItem.title = "VIEW_CONTROLLER_CUSTOM_EVENT_TITLE".localized()
    }
    
    private func insertNewParameter() {
        guard let key = getItem(textField: key) else { return }
        guard let value = getItem(textField: value) else { return }
        let indexForType = pickerView.selectedRow(inComponent: 0)
        let type = parametersTypes[indexForType]
        let parameter = CustomEventParameter(value: value, key: key, type: type)
        parameters.append(parameter)
        insertRow()
    }
    
    private func cleanData() {
        self.parameters.removeAll()
        tableView.reloadData()
        self.key.text = ""
        self.value.text = ""
        self.eventAction.text = ""
        self.eventLabel.text = ""
        view.endEditing(true)
    }
    
    private func makeParameters() -> TrackerParams? {
        let parameters: TrackerParams = TrackerParams.make { (builder) in
            for parameter in self.parameters {
                switch parameter.type {
                case .double:
                    guard let doubleValue = Double(parameter.value) else { return }
                    builder.setDouble(doubleValue, forKey: parameter.key)
                case .int:
                    guard let intValue = Int(parameter.value) else { return }
                    builder.setInt(intValue, forKey: parameter.key)
                case .string:
                    builder.setString(parameter.value, forKey: parameter.key)
                }
            }
        }
        
        return parameters
    }
    
    private func getItem(textField: UITextField) -> String? {
        guard let item = textField.text, item != "" else {
            textField.animateEmpty(withDuration: 0.2)
            
            return nil
        }
        
        return item
    }

    private func deleteRow(at indexPath: IndexPath) {
        parameters.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    private func insertRow() {
        let indexPath = IndexPath(row: parameters.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        self.key.text = ""
        self.value.text = ""
    }
    
    private func setValueLabelKeyboardType(_ type: UIKeyboardType) {
        value.keyboardType = type
        value.resignFirstResponder()
        value.becomeFirstResponder()
        value.text = ""
    }
    
}

extension CustomEventViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parameters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomEventTableViewCell", for: indexPath) as? CustomEventTableViewCell else { fatalError() }
        let index = indexPath.row
        let parameter = parameters[index]
        let key = parameter.key
        let value = parameter.value
        let type = parameter.type
        cell.update(key, value, type)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteRow(at: indexPath)
        }
    }
}

extension CustomEventViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parametersTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parametersTypes[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            setValueLabelKeyboardType(.numberPad)
        case 1:
            setValueLabelKeyboardType(.default)
        case 2:
            setValueLabelKeyboardType(.decimalPad)
        default:
            setValueLabelKeyboardType(.default)
        }
    }
}
