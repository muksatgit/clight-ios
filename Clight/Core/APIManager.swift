//
//  APIManager.swift
//  Clight
//
//  Created by Mukesh Kumar on 2020-04-18.
//  Copyright © 2020 Mukesh. All rights reserved.
//

import Foundation

protocol APIManagerDelegate {
    func didReceiveResponse(_ apiManager:APIManager, _ data:Data)
    func didFailWithError(error:Error)
}

struct APIManager {
    
    var delegate:APIManagerDelegate?
    
    func triggreAPICall(withURL apiURL:String)
    {
        let url = URL(string: apiURL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("7f58129207b943c8a1d41e4699f9db92", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        urlRequest.setValue("11", forHTTPHeaderField: "API-VERSION")
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil{
               // print("error in request: \(error)")
                self.delegate?.didFailWithError(error: error!)
                return
            }
            let httpResponse = response as! HTTPURLResponse
            
            if(httpResponse.statusCode != 404)
            {
                if let safeData = data{
                  //  print("Data locaded")
                    self.delegate?.didReceiveResponse(self, safeData)
                }
            }
         
        }
           task.resume()
    }
    
    
    
}


