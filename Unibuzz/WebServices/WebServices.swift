//
//  WebServices.swift
//  MunawlaApp
//
//  Created by Khadim Hussain on 6/28/19.
//  Copyright © 2019 Khadim Hussain. All rights reserved.
//

import UIKit
import Alamofire


typealias apiSuccess = (_ data: Data) -> ()
typealias apiFailure = (_ errorString: String) -> ()
typealias HTTPfailure = (_ errorString: String) -> ()

class WebServices {
    
    class func URLResponse(_ url:String, method: HTTPMethod ,parameters: [String: Any]?, headers: String?,  withSuccess success: @escaping apiSuccess, withapiFiluer failure: @escaping apiFailure) {
        
        
        let completeUrl : String = AppConstants.apiBaseUrl + url
        var headersToken =  HTTPHeaders()


			headersToken = [

				"Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImM3M2E1Yjc3OGFjZWMwNTM3MDVlYTU0YWRlYWFhYTY4OTM1YjBhMmQ2ZGRhYWRkM2JmMzQ3MDExODkzNjI4ZDM0NTQ1MjNkOTI2N2VlNzQxIn0.eyJhdWQiOiIyIiwianRpIjoiYzczYTViNzc4YWNlYzA1MzcwNWVhNTRhZGVhYWFhNjg5MzViMGEyZDZkZGFhZGQzYmYzNDcwMTE4OTM2MjhkMzQ1NDUyM2Q5MjY3ZWU3NDEiLCJpYXQiOjE1NjI3NjQ1NjcsIm5iZiI6MTU2Mjc2NDU2NywiZXhwIjoxNTk0Mzg2OTY3LCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.m3_AWrx7IAAW6IFHHFAiWNvh_vl9yYs_n5MjmFDSHIS1WT5s0zW-09FvLXaajAqqK9MqsVsidi5859ygq3SfJg",

				"Content-Type":"application/json",
				"Accept": "application/json"
			]
       
        
        Alamofire.request(completeUrl, method:method, parameters: nil, encoding: URLEncoding.httpBody, headers:headersToken).validate(statusCode: 200..<600).responseData(completionHandler: {   respones in
            switch respones.result {
                
            case .success(let value):
                
                success(value)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
        
    }


    
    
    class func UpLoadURLResponse(_ url:String, method: HTTPMethod ,parameters: [String: Any]?, headers: String?, Image: UIImage?, withKeyName: String?,  withSuccess success: @escaping apiSuccess, withapiFiluer failure: @escaping apiFailure) {
        
        let completeUrl : String = AppConstants.apiBaseUrl + url
        var headersToken =  HTTPHeaders()
        
        if headers != nil {
            
            if let token = headers {
                
                headersToken = ["Authorization":"Bearer \(token)"]
                print("Header token is : ",headersToken)
            }
        }
        
        let imageData = (Image ?? UIImage()).pngData()
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(imageData ?? Data(), withName: withKeyName ?? "", fileName: "Image", mimeType: "image/jpeg")
            
        }, to:completeUrl, method:.post, headers: headersToken, encodingCompletion: { respones in
            
            switch respones {
                
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    
                    //  debugPrint("SUCCESS RESPONSE: \(response)")
                    print("SUCCESS RESPONSE: \(response.result.value ?? "")")
                    
                    success(response.data ?? NSData() as Data)
                    
                }
                
            case .failure(let error):
                // hide progressbas here
                print("ERROR RESPONSE: \(error)")
                failure(error .localizedDescription)
            }
        })
    }
    
    class func UpLoadVideoURLResponse(_ url:String, method: HTTPMethod ,parameters: [String: Any]?, headers: String?, video: URL?,  withSuccess success: @escaping apiSuccess, withapiFiluer failure: @escaping apiFailure) {
        
        let completeUrl : String = AppConstants.apiBaseUrl + url
        var headersToken =  HTTPHeaders()
        
        if headers != nil{
            
            if let token = headers{
                
                headersToken = ["Authorization":"Bearer \(token)"]
                print("Header token is : ",headersToken)
            }
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(video!, withName: "file", fileName: "Video", mimeType: "video/mp4")
            //   multipartFormData.append((video.da(using: String.Encoding.utf8, allowLossyConversion: false))!, withName: "media")
            
        }, to:completeUrl, method:.post, headers: headersToken, encodingCompletion: { respones in
            
            switch respones {
                
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    
                    //  debugPrint("SUCCESS RESPONSE: \(response)")
                    print("SUCCESS RESPONSE: \(response.result.value ?? "")")
                    
                    success(response.data ?? NSData() as Data)
                    
                }
                
            case .failure(let error):
                // hide progressbas here
                print("ERROR RESPONSE: \(error)")
                failure(error .localizedDescription)
            }
        })
    }
  
    // Get Request with patamas
    class func URLGetResponseWithParmeters(_ url:String, method: HTTPMethod ,parameters: [String: Any]?, headers: String?,  withSuccess success: @escaping apiSuccess, withapiFiluer failure: @escaping apiFailure) {
        
        
        let completeUrl : String = AppConstants.apiBaseUrl + url
        var headersToken =  HTTPHeaders()
        
        if headers != nil{
            
            if let token = headers{
                
                headersToken = ["Authorization":"Bearer \(token)"]
                print("Header token is : ",headersToken)
            }
        }
        
        Alamofire.request(completeUrl, method:method, parameters: parameters, headers:headersToken).validate(statusCode: 200..<600).responseData(completionHandler: {   respones in
            switch respones.result {
                
            case .success(let value):
                
                success(value)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
    }


}
