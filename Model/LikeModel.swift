//
//  LikeModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/18.
//

import Foundation

struct LikeModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: LikeResultModel?
    
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
        result = try values.decodeIfPresent(LikeResultModel.self, forKey: .result)
    }
}

struct LikeResultModel: Codable {
    let likeId: Int?
    
    enum CodingKeys: String, CodingKey {
        case likeId
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        likeId = try values.decodeIfPresent(Int.self, forKey: .likeId)
    }
}
