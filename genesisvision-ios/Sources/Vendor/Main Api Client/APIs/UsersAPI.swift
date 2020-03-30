//
// UsersAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class UsersAPI {
    /**
     Public profile
     
     - parameter id: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getManagerProfile(id: String, completion: @escaping ((_ data: PublicProfile?,_ error: Error?) -> Void)) {
        getManagerProfileWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Public profile
     - GET /v2.0/users/{id}
     - examples: [{contentType=application/json, example={
  "socialLinks" : [ {
    "name" : "name",
    "logo" : "logo",
    "type" : { },
    "value" : "value",
    "url" : "url"
  }, {
    "name" : "name",
    "logo" : "logo",
    "type" : { },
    "value" : "value",
    "url" : "url"
  } ],
  "assets" : [ "assets", "assets" ],
  "about" : "about",
  "regDate" : "2000-01-23T04:56:07.000+00:00",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "avatar" : "avatar",
  "url" : "url",
  "username" : "username"
}}]
     
     - parameter id: (path)  

     - returns: RequestBuilder<PublicProfile> 
     */
    open class func getManagerProfileWithRequestBuilder(id: String) -> RequestBuilder<PublicProfile> {
        var path = "/v2.0/users/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<PublicProfile>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sorting
     */
    public enum Sorting_getUsersList: String { 
        case byNameAsc = "ByNameAsc"
        case byNameDesc = "ByNameDesc"
        case byAgeAsc = "ByAgeAsc"
        case byAgeDesc = "ByAgeDesc"
        case byAumAsc = "ByAumAsc"
        case byAumDesc = "ByAumDesc"
        case byFollowersAsc = "ByFollowersAsc"
        case byFollowersDesc = "ByFollowersDesc"
        case byInvestorsAsc = "ByInvestorsAsc"
        case byInvestorsDesc = "ByInvestorsDesc"
        case byPopularityAsc = "ByPopularityAsc"
        case byPopularityDesc = "ByPopularityDesc"
        case byProfitAsc = "ByProfitAsc"
        case byProfitDesc = "ByProfitDesc"
        case byTradingProfitAsc = "ByTradingProfitAsc"
        case byTradingProfitDesc = "ByTradingProfitDesc"
        case byInvestingProfitAsc = "ByInvestingProfitAsc"
        case byInvestingProfitDesc = "ByInvestingProfitDesc"
    }

    /**
     Get users list
     
     - parameter facetId: (query)  (optional)
     - parameter sorting: (query)  (optional)
     - parameter tags: (query)  (optional)
     - parameter skip: (query)  (optional)
     - parameter take: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getUsersList(facetId: String? = nil, sorting: Sorting_getUsersList? = nil, tags: [String]? = nil, skip: Int? = nil, take: Int? = nil, completion: @escaping ((_ data: ItemsViewModelUserDetailsList?,_ error: Error?) -> Void)) {
        getUsersListWithRequestBuilder(facetId: facetId, sorting: sorting, tags: tags, skip: skip, take: take).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Get users list
     - GET /v2.0/users/list
     - examples: [{contentType=application/json, example={
  "total" : 7,
  "items" : [ {
    "tradingProfit" : 5.637376656633329,
    "socialLinks" : [ {
      "name" : "name",
      "logo" : "logo",
      "type" : { },
      "value" : "value",
      "url" : "url"
    }, {
      "name" : "name",
      "logo" : "logo",
      "type" : { },
      "value" : "value",
      "url" : "url"
    } ],
    "totalProfit" : 5.962133916683182,
    "regDate" : "2000-01-23T04:56:07.000+00:00",
    "avatar" : "avatar",
    "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "investingProfit" : 2.3021358869347655,
    "url" : "url",
    "tags" : [ {
      "color" : "color",
      "name" : "name"
    }, {
      "color" : "color",
      "name" : "name"
    } ],
    "assetsUnderManagement" : 0.8008281904610115,
    "followersCount" : 1,
    "username" : "username",
    "investorsCount" : 6
  }, {
    "tradingProfit" : 5.637376656633329,
    "socialLinks" : [ {
      "name" : "name",
      "logo" : "logo",
      "type" : { },
      "value" : "value",
      "url" : "url"
    }, {
      "name" : "name",
      "logo" : "logo",
      "type" : { },
      "value" : "value",
      "url" : "url"
    } ],
    "totalProfit" : 5.962133916683182,
    "regDate" : "2000-01-23T04:56:07.000+00:00",
    "avatar" : "avatar",
    "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "investingProfit" : 2.3021358869347655,
    "url" : "url",
    "tags" : [ {
      "color" : "color",
      "name" : "name"
    }, {
      "color" : "color",
      "name" : "name"
    } ],
    "assetsUnderManagement" : 0.8008281904610115,
    "followersCount" : 1,
    "username" : "username",
    "investorsCount" : 6
  } ]
}}]
     
     - parameter facetId: (query)  (optional)
     - parameter sorting: (query)  (optional)
     - parameter tags: (query)  (optional)
     - parameter skip: (query)  (optional)
     - parameter take: (query)  (optional)

     - returns: RequestBuilder<ItemsViewModelUserDetailsList> 
     */
    open class func getUsersListWithRequestBuilder(facetId: String? = nil, sorting: Sorting_getUsersList? = nil, tags: [String]? = nil, skip: Int? = nil, take: Int? = nil) -> RequestBuilder<ItemsViewModelUserDetailsList> {
        let path = "/v2.0/users/list"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "FacetId": facetId, 
            "Sorting": sorting?.rawValue, 
            "Tags": tags, 
            "Skip": skip?.encodeToJSON(), 
            "Take": take?.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<ItemsViewModelUserDetailsList>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}