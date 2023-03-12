//
//  DetailInforModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import Foundation

struct DetailInforModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: DetailInforResultModel?

    enum CodingKeys: String, CodingKey {
        case isSuccess
        case code
        case message
        case result
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isSuccess = try values.decodeIfPresent(Bool.self, forKey: .isSuccess)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent(DetailInforResultModel.self, forKey: .result)
    }
}

struct DetailInforResultModel: Codable {
    let getUserDataRes: DetailgetUserDataRes?
    let getUserProductsRes : DetailgetUserProductsRes?
    let getProductsImgRes : DetailgetProductsImgRes?
   
    
    
    struct DetailgetUserDataRes : Codable{
        let score : Double?
        let profileImageUrl : String?
        let userNickName : String?
    }
    struct DetailgetUserProductsRes : Codable {
        let productId :  Int?
        let userId : Int?
        let title : String?
        let price : String?
        let like : Double?
        let likeId : Int?
    }
    struct DetailgetProductsImgRes : Codable {
        let productId :  Int?
        let imageUrl : String?
    }

    enum CodingKeys: String, CodingKey {
        case getUserDataRes
        case getUserProductsRes
        case getProductsImgRes
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        getUserDataRes = try values.decodeIfPresent(DetailgetUserDataRes.self, forKey: .getUserDataRes)
        getUserProductsRes = try values.decodeIfPresent(DetailgetUserProductsRes.self, forKey: .getUserProductsRes)
        getProductsImgRes = try values.decodeIfPresent(DetailgetProductsImgRes.self, forKey: .getProductsImgRes)
        

    }
}
