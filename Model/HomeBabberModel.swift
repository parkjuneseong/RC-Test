//
//  HomeBabberModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.

import Foundation

struct HomeBabberModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: HomeBabberResultModel?
    
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
        result = try values.decodeIfPresent(HomeBabberResultModel.self, forKey: .result)
    }
}

struct HomeBabberResultModel: Codable {
    let bannerId: Int?
    let bannerImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case bannerId
        case bannerImageUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bannerId = try values.decodeIfPresent(Int.self, forKey: .bannerId)
        bannerImageUrl = try values.decodeIfPresent(String.self, forKey: .bannerImageUrl)
    }
}
