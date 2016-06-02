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
    
    static func GetAllDPNames()->Array<String>{
        let url = urlBase+"GetAllDPNames"
        var para = "loginname=\(GlobalPara.UserName)&password=\(GlobalPara.PSW)"
        
        var list = Array<String>()
        
        var result = GetRequest(url, para: para)
        if(!result.isEmpty){
            var json:AnyObject? = NSJSONSerialization.JSONObjectWithData(result.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!, options: NSJSONReadingOptions.MutableContainers, error: nil)
            var dps = json?.objectForKey("DP") as NSMutableArray
            for dp in dps{
                var name = dp["name"] as String!
                if !name.isEmpty{
                    list.append(name)
                }
            }
            
        }
        return list
    }
    
    static func GetAllSettings()->Array<String>{
        let url=urlBase+"GetAllSettings"
        var para = "loginname=\(GlobalPara.UserName)&password=\(GlobalPara.PSW)"
        
        var list = Array<String>()
        
        var result = GetRequest(url, para: para)
        if(!result.isEmpty){
            var json:AnyObject? = NSJSONSerialization.JSONObjectWithData(result.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!, options: NSJSONReadingOptions.MutableContainers, error: nil)
            var dps = json?.objectForKey("settingEntity") as NSMutableArray
            for dp in dps{
                var name = dp["profilename"] as String!
                if !name.isEmpty{
                    list.append(name)
                }
            }
            
        }
        return list
    }
    
    static func SetDPConfig(dpName:String, profileName:String){
        let url = urlBase+"SetDPConfig"
        var para = "loginname=\(GlobalPara.UserName)&password=\(GlobalPara.PSW)&dpname=\(dpName)+&profilename=\(profileName)"
        PostRequest(url, para: para)
    }
    
    static func GetRequest(url:String, para:String)->String{
        
        var postData:NSData = para.dataUsingEncoding(NSUTF8StringEncoding)!
        let nsurl = NSURL(string: url+"?"+para)!
        
        var  request = NSMutableURLRequest(URL: nsurl)
        request.HTTPMethod="GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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