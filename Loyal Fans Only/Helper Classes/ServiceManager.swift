
//  Created by Darshan Gajera on 03/26/20.
//  Copyright © 2020 Calendar. All rights reserved.
//

import UIKit
import RxAlamofire
import Alamofire
import RxSwift
import RxCocoa
import Reachability

// swiftlint:disable all
enum API : String {
    static let socketURL = "http://3.15.177.64:3960/"
    static let imgBaseURL = "http://3.15.177.64:3000/"
    static let BaseURL = "http://13.234.34.241:3000/API/"
    
    case Login = "login"
    case checkOtp = "checkOtp"
    case registration = "registration"
    case userchild = "userchild"
    
    var URL : String {
        get{
            return API.BaseURL + self.rawValue
        }
    }
}

class ServiceManager: NSObject {
    let disposeBag = DisposeBag()
    static let sharedInstance : ServiceManager = {
        let instance = ServiceManager()
        return instance
    }()
    
    func postRequest(parameterDict: [String: Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = false, isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
            print("URL: \(aUrl)")
            print("Param: \(parameterDict)")

            if Reachability.Connection.self != .none {
                if isLoader {
                    LoadingView.startLoading()
                }
                var header: [String: String]?
                if(parameterDict["user_id"] != nil) {
                    if let token = AppPrefsManager.sharedInstance.getJWTToken() {
                        header = ["Content-Type":"application/x-www-form-urlencoded","x-access-token":token]
                    } else {
                        header = ["Content-Type":"application/x-www-form-urlencoded"]
                    }
                } else {
                    header = ["Content-Type":"application/x-www-form-urlencoded"]
                }
                
                RxAlamofire.requestJSON(.post,aUrl, parameters: parameterDict, headers:header)
                    .debug()
                    .subscribe(onNext: { (r, json) in
                        do {
                            if isLoader {
                                LoadingView.stopLoading()
                            }
                            if r.statusCode == 200 {
                                let dicData = json as! NSDictionary
                                print("response:\(dicData)")
                                if let error = dicData.value(forKey: "errors") as? NSArray {
                                    if error.count > 0 {
                                        let msg = (error.firstObject as! NSDictionary).value(forKey: "msg") as! String
                                        SnackBar.show(strMessage: msg, type: .negative)
                                    }
                                } else {
                                    let status: Bool = dicData.value(forKey: "status") as! Bool
                                    if status {
                                        if isSuccessAlert {
                                            if dicData.value(forKey: "msg") != nil {
                                                SnackBar.show(strMessage: dicData.value(forKey: "msg") as! String, type: .positive)
                                            }
                                        }
                                        block(dicData, nil)
                                    } else {
                                        if isFailureAlert {
                                            SnackBar.show(strMessage: dicData.value(forKey: "msg") as! String, type: .negative)
                                        } else {
                                            block(nil, nil)
                                        }
                                    }
                                }
                            } else if r.statusCode == 404 {
                                if isFailureAlert {
                                    let dicData = json as! NSDictionary
                                    SnackBar.show(strMessage: dicData.value(forKey: "msg") as! String, type: .negative)
                                }
                            } else if r.statusCode == 403 || r.statusCode == 401 {
                                
                            } else if r.statusCode == 500 {
                                SnackBar.show(strMessage: ErrorMesssages.wrong, type: .negative)
                            }
                        }
                    }, onError: {(error) in
                        LoadingView.stopLoading()
                        SnackBar.show(strMessage: error.localizedDescription, type: .negative)
                    })
                    .disposed(by: disposeBag)
            }
        }
    
    func getRequest(parameterDict:[String : Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = true , isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
        if Reachability.Connection.self != .none {
            //            let url = URL.init(string: aUrl, parameters: parameterDict as! [String : String])
             print("URL: \(aUrl)")
             print("Param: \(parameterDict)")
            if Reachability.Connection.self != .none {
                if isLoader {
                    LoadingView.startLoading()
                }
                
                RxAlamofire.requestJSON(.get,aUrl, headers:nil)
                    .debug()
                    .subscribe(onNext: { (r, json) in
                        do {
                            LoadingView.stopLoading()
                            if r.statusCode == 200 {
                                let dicData = json as! NSDictionary
                                block(dicData, nil)
                            } else {
                                block(nil, nil)
                            }
                        }
                    }, onError: {(error) in
                        LoadingView.stopLoading()
                    })
                    .disposed(by: disposeBag)
            }
        }
    }
    
    func postRequestNew(parameterDict:[String : Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = true , isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
        if Reachability.Connection.self != .none {
            if isLoader {
                LoadingView.startLoading()
            }
             print("URL: \(aUrl)")
             print("Param: \(parameterDict)")
            Alamofire.request(aUrl, method: HTTPMethod.post , parameters: parameterDict,encoding: JSONEncoding.default, headers: nil).responseJSON {
                response in
                switch response.result {
                case .success:
                    do {
                        if isLoader {
                            LoadingView.stopLoading()
                        }
                        if response.response?.statusCode == 200 {
                          if let result = response.result.value {
                               print(result)
                              let JSON = result as! NSDictionary
                              if isSuccessAlert {
                                  if JSON.value(forKey: "msg") != nil {
                                      SnackBar.show(strMessage: JSON.value(forKey: "msg") as! String, type: .positive)
                                  }
                              }
                              block(JSON,nil)
                          }
                        } else if response.response?.statusCode == 403 || response.response?.statusCode == 401 {

                            
                        }
                    }
                    break
                case .failure(let error):
                    print("Error : ",error)
                    if isLoader {
                     LoadingView.stopLoading()
                    }
                }
            }
        }
    }
}

extension URL {
    /// Creates an NSURL with url-encoded parameters.
    init?(string : String, parameters : [String : String]) {
        guard var components = URLComponents(string: string) else { return nil }
        components.queryItems = parameters.map { return URLQueryItem(name: $0, value: $1) }
        guard let url = components.url else { return nil }
        // Kinda redundant, but we need to call init.
        self.init(string: url.absoluteString)
    }
}
   
