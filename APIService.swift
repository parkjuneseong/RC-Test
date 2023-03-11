//
//  APIService.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    private let baseUrl = "http://prod.yeonil.store"
    func getMyPage(userId: String, handler: ((MyPageModel) -> Void)?) {
        let url = baseUrl + "/users/\(userId)"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseDecodable(of: MyPageModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러 \(error)")
            }
        }
    }
    
    
    func postSign(param: [String: String], handler: ((SignModel) -> Void)?) {
        let url = baseUrl + "/users"
        
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: SignModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
                print("okay")
            case .failure(let error):
                print("에러 \(error)")
            }
        }
    }
    
    func postLogin(param: [String: String], handler: ((SignModel) -> Void)?) {
        let url = baseUrl + "/users/login"
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: SignModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러 \(error)")
            }
        }
    }
    func getHomeBanner(param: [String: String], handler: ((HomeBabberModel) -> Void)?) {
        let url = baseUrl + "/home/banner"
        AF.request(url, method: .get, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: HomeBabberModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러 \(error)")
            }
        }
    }
//    func getHomeProducts(param: [String: String], handler: ((HomeProductsModel) -> Void)?) {
//        let url = baseUrl + "/home/banner"
//        AF.request(url, method: .get, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: HomeProductsModel.self) { response in
//            switch response.result {
//            case .success(let model):
//                handler?(model)
//            case .failure(let error):
//                print("에러 \(error)")
//            }
//        }
//    }
}
