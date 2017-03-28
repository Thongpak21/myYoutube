//
//  ViewController.swift
//  youtube
//
//  Created by Thongpak on 3/25/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import UIKit

import RxSwift 
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        Observable.zip(extra(), extra2()) { ($0, $1) }.subscribe { event in
            switch event {
            case let .next(response1, response2):
                print(response1)
            default:
                break
            }
        }
    }


    
    func extra() -> Observable<ExtraPointLoginResponse> {
        return Observable.create { o in
            let task = APIRequest.request(withRouter: Router.getMock(), withHandler: { (response, error) in
                if let response = response as? ExtraPointLoginResponse {
                    o.onNext(response)
                }
            })
        
            return Disposables.create() {
                task?.cancel()
            }
        }
    }
    
    func extra2() -> Observable<ExtraPointLoginResponse> {
        return Observable.create { o in
            let task = APIRequest.request(withRouter: Router.getMock(), withHandler: { (response, error) in
                if let response = response as? ExtraPointLoginResponse {
                    o.onNext(response)
                }
            })
            return Disposables.create() {
                task?.cancel()
            }
        }
    }
}

