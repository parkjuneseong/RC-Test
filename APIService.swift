//
//  APIService.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import Foundation
import Alamofire
import AlamofireImage

class APIService {
    static let shared = APIService()
    private let baseUrl = "http://prod.yeonil.store"
  
    
    func postSign(param: [String: String], handler: ((SignModel) -> Void)?) {
        let url = baseUrl + "/users"
        
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: SignModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러sign \(error)")
            }
        }
    }
    
    func postLogin(param: [String: String], handler: ((LoginModel) -> Void)?) {
        let url = baseUrl + "/users/login"
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: LoginModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러Login \(error)")
            }
        }
    }
    
    func getMyPage(userId: String, handler: ((MyPageModel) -> Void)?) {
        let url = baseUrl + "/users/\(userId)"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .get, encoding: JSONEncoding.default,headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: MyPageModel.self) { response in
            switch response.result {
            case .success(let model):
                print("mypage성공")
                print(userId)
                handler?(model)
            case .failure(let error):
                print("에러myPage\(error)")
            }
        }
    }
    func getSell(userId: String, handler: ((SellModel) -> Void)?) {
        let url = baseUrl + "/users/\(userId)/sellproducts"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseDecodable(of: SellModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러sell\(error)")
            }
        }
    }
    
    func getHomeBanner(handler: ((HomeBannerModel) -> Void)?) {
        let url = baseUrl + "/home/banner"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: HomeBannerModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러banner \(error)")
            }
        }
    }
    
    func getHomeProducts(handler: ((HomeProductsModel) -> Void)?) {
        let url = baseUrl + "/home/products"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: HomeProductsModel.self) { response in
            switch response.result {
            case .success(let model):
                print("products 성공")
                handler?(model)
            case .failure(let error):
                print("에러products \(error)")
            }
        }
    }
    func getDetail(productId:Int, handler: ((DetailModel) -> Void)?) {
        let url = baseUrl + "/products/\(productId)/detail"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: DetailModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러datail \(error)")
            }
        }
    }
    
    func getDetailInfo(productId:Int, handler: ((DetailInfoModel) -> Void)?) {
        let url = baseUrl + "/products/\(productId)/storeinfo"
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseDecodable(of: DetailInfoModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러detailInfor \(error)")
            }
        }
    }
    
    func postRegistProduct(param: [String: Any], handler: ((RegistProductModel) -> Void)?) {
        let url = baseUrl + "/products"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: RegistProductModel.self) { response in
            switch response.result {
            case .success(let model):
                
                print("regist 성공")
                handler?(model)
        
            case .failure(let error):
                print("에러regis \(error)")
            }
        }
    }
     
    func patchRegistProductEdit(productId:Int, handler: ((RegistProductEditModel) -> Void)?) {
        let url = baseUrl + "/products\(productId)"
        
        AF.request(url, method: .patch, encoding: JSONEncoding.default).responseDecodable(of: RegistProductEditModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
                print("okay")
            case .failure(let error):
                print("에러editProducts \(error)")
            }
        }
    }
    func patchRegistProductDeleteResultModel(productId:Int, handler: ((RegistProductDeleteModel) -> Void)?) {
        let url = baseUrl + "/products\(productId)/status"
        
        AF.request(url, method: .patch, encoding: JSONEncoding.default).responseDecodable(of: RegistProductDeleteModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
                print("okay")
            case .failure(let error):
                print("에러 DeleteRegist\(error)")
            }
        }
    }
    func getSearch(param: [String: String], handler: ((SearchModel) -> Void)?) {
        let url = baseUrl + "products?title={title}"
        AF.request(url, method: .get, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: SearchModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러 Search\(error)")
            }
        }
    }
    func getSearchCategory(param: [String: String], handler: ((SearchCategoryModel) -> Void)?) {
        let url = baseUrl + "/products/category?category={category}"
        AF.request(url, method: .get, parameters: param, encoding: JSONEncoding.default).responseDecodable(of: SearchCategoryModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
            case .failure(let error):
                print("에러 category \(error)")
            }
        }
    }
    func postLike(productId: Int?, handler: ((LikeModel) -> Void)?) {
        let url = baseUrl + "/likes"
        let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        let param = ["userId": userId, "productId": "\(productId ?? 0)"]
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: LikeModel.self) { response in
            switch response.result {
            case .success(let model):
                print("찜이요")
                handler?(model)
            case .failure(let error):
                print("찜 실패요 \(error)")
            }
        }
    }
    //QueryString param?
    func getLike(userId: String, handler: ((AddLikeModel) -> Void)?) {
        let url = baseUrl + "/likes"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .get, parameters: ["userId": userId], encoding: URLEncoding.queryString, headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: AddLikeModel.self) { response in
            switch response.result {
            case .success(let model):
                print("addLike성공")
                handler?(model)
            case .failure(let error):
                print("에러찜이요\(error)")
            }
        }
    }
    func patchDeleteLikeModel(likeId: Int ,param: [String:String], handler: ((DeleteLikeModel) -> Void)?) {
        let url = baseUrl + "/likes/\(likeId)/status"
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        AF.request(url, method: .patch, parameters: param, encoding: JSONEncoding.default,headers: ["X-ACCESS-TOKEN": jwt]).responseDecodable(of: DeleteLikeModel.self) { response in
            switch response.result {
            case .success(let model):
                handler?(model)
                print("Delete okay")
            case .failure(let error):
                print("에러 Delete찜이요\(error)")
            }
        }
    }
}
