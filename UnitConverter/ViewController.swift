//
//  ViewController.swift
//  UnitConverter
//
//  Created by Denis Calixto on 9/23/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaultCelsiusPickerRowKey = "defaultCelsiusPickerRow"
    let defaultSegmentKey = "defaultSegment"

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var temperatureRange: TemperatureRange!
    
    private let unitConverter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        
        let defaultRow = currentRow()
        pickerView.selectRow(defaultRow, inComponent: 0, animated: false)
        pickerView(pickerView, didSelectRow: defaultRow, inComponent: 0)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        //print(sender.selectedSegmentIndex)
        saveSelectedSegment(sender.selectedSegmentIndex)
        displayConvertedTemperature()
    }
    
    func displayConvertedTemperature() {
        let unitType: TemperatureUnitType = currentSegment() == 0 ? .farenheit : .celsius
        let unitValue: TemperatureRange.
        temperatureLabel.text = unitConverter.temperatureString(for: row, unitType: unitType)
    }
    
    func saveSelectedSegment(_ segment: Int) {
        let defaults = UserDefaults.standard
        defaults.set(segment, forKey: defaultSegmentKey)
        defaults.synchronize()
    }
    
    func currentSegment() -> Int {
        let defaults = UserDefaults.standard
        defaults.object(forKey: defaultSegmentKey)
    }
    
    func saveSelectedRow(_ row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: defaultCelsiusPickerRowKey)
        defaults.synchronize()
    }
    
    func currentRow() -> Int {
        let defaults = UserDefaults.standard
        if let row = defaults.object(forKey: defaultCelsiusPickerRowKey) as? Int {
            return row
        } else {
            return pickerView.numberOfRows(inComponent: 0) / 2
        }
    }

}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureRange.temperatureValues[row])°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperature(for: row)
        saveSelectedRow(row)
    }    
    
}
