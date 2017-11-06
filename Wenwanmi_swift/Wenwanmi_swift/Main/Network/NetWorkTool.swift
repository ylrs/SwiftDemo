//
//  NetworkTool.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/3.
//  Copyright © 2017年 YLRS. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetWorkTool: NSObject {
    
    class func getJsonData(url:String, requestParam : Dictionary<String, Any>, success: @escaping(_ jsonData: Dictionary<String, Any>) -> (),failure:@escaping(Error) -> ()) {
        
        var param:Parameters = BaseParam

        let requestURL = BaseURL + url
        
        param += requestParam
        
        Alamofire.request(requestURL, method: .get, parameters: param, encoding: URLEncoding.default, headers: BaseHeader).responseJSON{ (response) in
            switch(response.result){
            case .success(_):
                let jsonDic:Dictionary<String,Any> = (response.result.value as! Dictionary?)!
                success(jsonDic)
                print(response.request?.url as Any)
                break
            case .failure(_):
                print(response.request?.url as Any)
                failure(response.result.error!)
                break
            }
        }
    }
    
    class func postJsonData(url:String, requestParam : Dictionary<String, Any>, success: @escaping(_ jsonData: Dictionary<String, Any>) -> (),failure:@escaping(Error) -> ()) {
        
        var param:Parameters = BaseParam
        
        let requestURL = BaseURL + url
        
        param += requestParam
        
        Alamofire.request(requestURL, method: .post, parameters: param, encoding: URLEncoding.default, headers: BaseHeader).responseJSON{ (response) in
            switch(response.result){
            case .success(_):
                
                let jsonDic:Dictionary<String,Any> = (response.result.value as! Dictionary?)!
                success(jsonDic)
                print(response.request?.url as Any)
                break
            case .failure(_):
                failure(response.result.error!)
                print(response.request?.url as Any)
                break
            }
        }
    }

}
