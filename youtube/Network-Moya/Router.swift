//
//  Router.swift
//  youtube
//
//  Created by Thongpak on 3/25/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import Foundation
import Alamofire

public protocol MyYoutubeRouter: URLRequestConvertible {
    
    var url: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var rawBody: NSData { get }
    var responseClass: BaseResponse.Type { get }

}


public enum Router: MyYoutubeRouter {

    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    public func asURLRequest() throws -> URLRequest {
        let baseUrl = try url.asURL()
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getMock(), .getMock2():
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }

    case getMock()
    case getMock2()
}

extension Router {
    public var url: String {
        return "http://mock.nextzy.me"
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getMock():
            return .get
        case .getMock2():
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .getMock(), .getMock2():
            return "/auth/mobile/0926621664/extrapointlogin"
        }
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        case .getMock(), .getMock2():
            return nil
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    public var rawBody: NSData {
        switch self {
        default:
            return NSData()
        }
    }
    
    public var responseClass: BaseResponse.Type {
        switch self {
        case .getMock2(), .getMock():
            return ExtraPointLoginResponse.self
        }
    }
    
    
    var urlPath: String {
        return url + path
    }
//    public var baseURL: URL {
//        return URL(string: "http://mock.nextzy.me")!
//    }
//    
//    public var path: String {
//        switch self {
//        case .getMock, .getMock2:
//            return "/auth/mobile/0926621664/extrapointlogin"
//            
//        }
//    }
//    
//    public var method: Moya.Method {
//        switch self {
//        case .getMock, .getMock2:
//            return .get
//        }
//    }
//    
//    public var parameters: [String : Any]? {
//        switch self {
//        default:
//            return nil
//        }
//    }
//    
//    public var parameterEncoding: ParameterEncoding {
//        switch self {
//        default:
//            return JSONEncoding.default
//        }
//    }
//    
//    public var task: Task {
//        switch self {
//        default:
//            return .request
//        }
//    }
//    
//    public var sampleData: Data {
//        switch self {
//        case .getMock, .getMock2:
//            return "".data(using: String.Encoding.utf8)!
//        default:
//            return "[{\"id\": \"FN-2187\"}]".data(using: String.Encoding.utf8)!
//        }
//    }
}
