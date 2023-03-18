//
//  AddLikeModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/18.
//

import Foundation

struct AddLikeModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [AddLikeResultModel]?
    
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
        result = try values.decodeIfPresent([AddLikeResultModel].self, forKey: .result)
    }
}

struct AddLikeResultModel: Codable {
    let likeId: Int?
    let title : String?
    let price : Int?
    let userNickName : String?
    let time : String?
    let imageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case likeId
        case title
        case price
        case userNickName
        case time
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        likeId = try values.decodeIfPresent(Int.self, forKey: .likeId)
     
        title = try values.decodeIfPresent(String.self, forKey: .title)
     
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        userNickName = try values.decodeIfPresent(String.self, forKey: .userNickName)
      
        time = try values.decodeIfPresent(String.self, forKey: .time)
     
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
    
    }
}
