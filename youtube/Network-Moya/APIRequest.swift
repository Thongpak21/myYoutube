//
//  APIRequest.swift
//  youtube
//
//  Created by Thongpak on 3/25/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

public class APIRequest {
    public typealias completionHandler = (BaseResponse?, NSError?) -> Void
    
    
    public static func request(withRouter router: TargetType, withHandler handler: @escaping completionHandler)  {
        let provider = RxMoyaProvider<MultiTarget>()
        provider.request(MultiTarget(router))
            .mapJSON()
            .subscribe { (event) in
                switch event {
                case let .next(response):
                    self.SuccessHandler(JSON: response as AnyObject, router: router , completionHandler: handler)
                    print(response)
                case let .error(error):
                    print(error)
                default:
                    break
                }
        }//.disposed(by: DisposeBag())
    }
//        return nil
    
    public static func SuccessHandler(JSON: AnyObject?, router: TargetType, completionHandler: APIRequest.completionHandler) {
        var instance: BaseResponse? = nil
        if let JSON = JSON {
            instance = BaseResponse.init(withDictionary: JSON)
        }
        completionHandler(instance!, nil)
    }
}
