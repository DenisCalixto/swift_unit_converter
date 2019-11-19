//
//  TemperatureRange.swift
//  UnitConverter
//
//  Created by Denis Calixto on 9/30/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit
import Foundation

class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let temperatureValues = (-100...100).map { $0 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
    }
    
    
    
}
