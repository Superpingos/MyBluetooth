//
//  ViewController.swift
//  MyBluetooth
//
//  Created by Superpingos on 23.09.17.
//  Copyright © 2017. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController, CBCentralManagerDelegate, CBPeripheralDelegate
{
    var centralManager: CBCentralManager?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        print("\(#function)")
    }
    
    override var representedObject: Any?
        {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        switch central.state {
        case .unsupported:
            print("This device does not support Bluetooth Low Energy.")
        case .unknown:
            print("The state of the BLE Manager is unknown.")
        case .unauthorized:
            print("This app is not authorized to use Bluetooth Low Energy.")
        case .resetting:
            print("The BLE Manager is resetting; a state update is pending.")
        case .poweredOff:
            print("Bluetooth on this device is currently powered off.")
        //case .poweredOn:
        default: central.scanForPeripherals(withServices: nil, options: nil)
        print("Bluetooth is available")
        }
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral)
    {
        print("Peripheral.name: \(peripheral.name)")
        central.stopScan()
    }
}
