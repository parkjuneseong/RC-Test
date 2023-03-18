//
//  DetailInforModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import Foundation

struct DetailInfoModel: Codable {
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
    let getUserProductsRes : [DetailgetUserProductsRes]?
    

    enum CodingKeys: String, CodingKey {
        case getUserDataRes
        case getUserProductsRes
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        getUserDataRes = try values.decodeIfPresent(DetailgetUserDataRes.self, forKey: .getUserDataRes)
        getUserProductsRes = try values.decodeIfPresent([DetailgetUserProductsRes].self, forKey: .getUserProductsRes)
    }
}

struct DetailgetUserDataRes : Codable{
    let score : Float?
    let profileImageUrl : String?
    let userNickName : String?
    
    enum CodingKeys: String, CodingKey {
        case score
        case profileImageUrl
        case userNickName
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        score = try values.decodeIfPresent(Float.self, forKey: .score)
        profileImageUrl = try values.decodeIfPresent(String.self, forKey: .profileImageUrl)
        userNickName = try values.decodeIfPresent(String.self, forKey: .userNickName)
    }
}

struct DetailgetUserProductsRes : Codable {
    let productId :  Int?
    let userId : Int?
    let title : String?
    let price : String?
    let like : Int?
    let likeId : Int?
    let getProductsImgRes : [DetailgetProductsImgRes]?
    
    enum CodingKeys: String, CodingKey {
        case productId
        case userId
        case title
        case price
        case like
        case likeId
        case getProductsImgRes
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        like = try values.decodeIfPresent(Int.self, forKey: .like)
        likeId = try values.decodeIfPresent(Int.self, forKey: .likeId)
        getProductsImgRes = try values.decodeIfPresent([DetailgetProductsImgRes].self, forKey: .getProductsImgRes)
    }
}

struct DetailgetProductsImgRes : Codable {
    let productId : Int?
    let imageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case productId
        case imageUrl
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}
