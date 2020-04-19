//
//  LocationManager.swift
//  Clight
//
//  Created by Mukesh Kumar on 2020-04-18.
//  Copyright © 2020 Mukesh. All rights reserved.
//

protocol LocationModelDelegate {
    func didReceivedData(_ locationsModel:LocationsModel, data:LocationData)
    func didFailWithError(error:Error)
}


import Foundation

struct LocationsModel {
        
    var delegate:LocationModelDelegate?
    
    //var data:Data?
    var apiManager = APIManager()
    var locationData:LocationData?
    
    mutating func requestData()
    {
        apiManager.delegate = self
        apiManager.triggreAPICall(withURL: "https://stgapi.scandichotels.com/hotel/locations")
    }
    
    func parseJSONData(_ locationData:Data)
    {
        let decoder = JSONDecoder()
        do
        {
            var locationData = try decoder.decode(LocationData.self, from: locationData)
            self.delegate?.didReceivedData(self, data: locationData)
            /*for var i in (0..<decodedData.data.count)
            {
                let locType:String = decodedData.data[i].type
                let locName:String = decodedData.data[i].attributes.name
            }*/
        }
        catch
        {
            print("error in prsing: \(error)")
            self.delegate?.didFailWithError(error: error)
        }
    }
}

//MARK: - APIManagerDelegate
extension LocationsModel:APIManagerDelegate{
    func didReceiveResponse(_ apiManager: APIManager, _ data: Data) {
        print("Data Received in ...")
        parseJSONData(data)
    }
    
    func didFailWithError(error: Error) {
        print("Errors Received in ...")
    }
    
    
}

