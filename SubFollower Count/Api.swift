//
//  Api.swift
//  EVV
//
//  Created by Saif Mukadam on 19/11/19.
//  Copyright © 2019 Saif Mukadam. All rights reserved.
//


import Foundation
import SwiftyJSON
import Alamofire

func postWithParameter(Url:String,completionhandler:@escaping (JSON, Error?) -> ()){
    let url =  Url
    let header : HTTPHeaders = ["Content-Type":"application/json"]//,"Token":(UserDefaults.standard.getToken())
    AF.request(url,method:.get,encoding: JSONEncoding.default,headers:header).responseJSON {
        response in
        switch(response.result){
        case .success(_:):
            completionhandler(JSON(response.data!), nil)
            break
        case .failure(_:):
            completionhandler(JSON.null,response.error)
            break
        }
    }
}

func postWithParameterTwitter(username:String,completionhandler:@escaping (JSON, Error?) -> ()){
    
    let url =  "https://api.twitter.com/1.1/users/show.json?screen_name="+username
    
    let header : HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer AAAAAAAAAAAAAAAAAAAAAOPrqQEAAAAA3WHyZdVu7DcjpsPXVmRsJQiBFuA%3DHjcbVjFQsLztPgsgyIhBfLZ4pDqUCMjqtiTmZbbajQll46uMZq"]
    
    AF.request(url,method:.get,encoding: JSONEncoding.default,headers:header).responseJSON {
        response in
        switch(response.result){
        case .success(_:):
            completionhandler(JSON(response.data!), nil)
            break
        case .failure(_:):
            completionhandler(JSON.null,response.error)
            break
        }
    }
}


var indicator = UIActivityIndicatorView()

func startIndicator(selfo:UIViewController) {
    indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    indicator.color = .systemRed
    indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    indicator.center = selfo.view.center
    selfo.view.addSubview(indicator)
    selfo.view.bringSubviewToFront(indicator)
    indicator.startAnimating()
}

func stopIndicator() {
    indicator.stopAnimating()
}
