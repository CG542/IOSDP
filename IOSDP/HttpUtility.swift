//
//  HttpUtility.swift
//  IOSDP
//
//  Created by Andy on 5/26/16.
//  Copyright (c) 2016 Mot. All rights reserved.
//

import Foundation

public struct HttpUtility{
   
    static let urlBase="http://yxzhm.com/api/DP/";
    
    static func ValdateUser(name:String, password:String) ->Bool{
        var url = urlBase+"Login"
        var para = "loginname=\(name)&password=\(password)"
        var result = (PostRequest(url, para:para) as NSString).boolValue
        return result
    }
    
    static func PostRequest(url:String, para:String)->String{
        
        var postData:NSData = para.dataUsingEncoding(NSUTF8StringEncoding)!
        let nsurl = NSURL(string: url)!
        
        var  request = NSMutableURLRequest(URL: nsurl)
        request.HTTPMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody=postData
        
        var response:NSURLResponse?
        var error:NSError?
        
        let received:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response,error:&error)
        if(error != nil){
            print(error?.code)
            return ""
        }
        
        var result = NSString(data:received!, encoding: NSUTF8StringEncoding)
        
        return result!;
    }
}