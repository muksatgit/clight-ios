//
//  ViewController.swift
//  Clight
//
//  Created by Mukesh Kumar on 2020-04-18.
//  Copyright © 2020 Mukesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LocationModelDelegate {
    func didReceivedData(_ locationsModel: LocationsModel, data: LocationData) {
        for var i in (0..<data.data.count)
        {
            let locType:String = data.data[i].type
            let locId:String = data.data[i].id
            let locName:String = data.data[i].attributes.name
            print("\(locId)")
        }
    }
    
    func didFailWithError(error: Error) {
        print("Somehting went wrong..\(error)")
    }
    
    
    var locationManager = LocationsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestData()
        
        // Do any additional setup after loading the view.
    }
}

