//
//  APIRequest.swift
//  youtube
//
//  Created by Thongpak on 3/25/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import Foundation
import Alamofire

public class APIRequest {
    public typealias completionHandler = (Any, NSError?) -> Void

    
    public static func request(withRouter router: MyYoutubeRouter, withHandler handler: @escaping completionHandler) -> Request?  {
        return Alamofire.request(router).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let JSON):
                SuccessHandler(JSON: JSON as AnyObject?, router: router, completionHandler: handler)
            case .failure(let error):
                print(error)
            }
        })
    }
//        return nil
    
    public static func SuccessHandler(JSON: AnyObject?, router: MyYoutubeRouter, completionHandler: APIRequest.completionHandler) {
        var instance: BaseResponse? = nil
        if let JSON = JSON {
            instance = router.responseClass.init(withDictionary: JSON)//BaseResponse.init(withDictionary: JSON)
        }
        completionHandler(instance!, nil)
    }
}
