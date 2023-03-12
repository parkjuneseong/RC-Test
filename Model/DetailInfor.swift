//
//  DetailInfor.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import Foundation

struct DetailInforModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: DetailResultModel?

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
        result = try values.decodeIfPresent(DetailResultModel.self, forKey: .result)
    }
}

struct DetailResultModel: Codable {
    let productId: Int?
    let userId : Int?
    let title : String?
    let category : String?
    let location : String?
    let productStatus : String?
    let isChangable : String?
    let quantity : Int?
    let price : Int?
    let isFreeShip : String?
    let contents :String?
    let isSagePay : String?
    let tradeStatus : String?
    let productUpdatedAtTime : String?
    let likes : DetailLikes?
    let imgs : DetailImgs?
    struct DetailLikes : Codable {
        let likes :  Int?
    }
    struct DetailImgs : Codable {
        let productId :  Int?
        let imageUrl : String?
    }

    enum CodingKeys: String, CodingKey {
        case productId
        case userId
        case title
        case category
        case location
        case productStatus
        case isChangable
        case quantity
        case price
        case isFreeShip
        case contents
        case isSagePay
        case tradeStatus
        case productUpdatedAtTime
        case likes
        case imgs
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        productStatus = try values.decodeIfPresent(String.self, forKey: .productStatus)
        isChangable = try values.decodeIfPresent(String.self, forKey: .isChangable)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        isFreeShip = try values.decodeIfPresent(String.self, forKey: .isFreeShip)
        contents = try values.decodeIfPresent(String.self, forKey: .contents)
        isSagePay = try values.decodeIfPresent(String.self, forKey: .isSagePay)
        tradeStatus = try values.decodeIfPresent(String.self, forKey: .tradeStatus)
        productUpdatedAtTime = try values.decodeIfPresent(String.self, forKey: .productUpdatedAtTime)
        likes = try values.decodeIfPresent(DetailLikes.self, forKey: .likes)
        imgs = try values.decodeIfPresent(DetailImgs.self, forKey: .imgs)


    }
}
