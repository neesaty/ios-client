//
// SearchAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SearchAPI {
    /**
     Program / fund / manager search
     
     - parameter mask: (query)  (optional)
     - parameter take: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10SearchGet(mask: String? = nil, take: Int? = nil, completion: @escaping ((_ data: SearchViewModel?,_ error: Error?) -> Void)) {
        v10SearchGetWithRequestBuilder(mask: mask, take: take).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Program / fund / manager search
     - GET /v1.0/search
     - examples: [{contentType=application/json, example={
  "funds" : {
    "total" : 6,
    "funds" : [ {
      "totalAssetsCount" : 7,
      "statistic" : {
        "balanceGVT" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "profitPercent" : 4.965218492984954,
        "drawdownPercent" : 5.025004791520295,
        "balanceSecondary" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "investorsCount" : 9
      },
      "color" : "color",
      "manager" : {
        "registrationDate" : "2000-01-23T04:56:07.000+00:00",
        "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
        "avatar" : "avatar",
        "url" : "url",
        "username" : "username"
      },
      "topFundAssets" : [ {
        "name" : "name",
        "icon" : "icon",
        "asset" : "asset",
        "percent" : 1.1730742509559433
      }, {
        "name" : "name",
        "icon" : "icon",
        "asset" : "asset",
        "percent" : 1.1730742509559433
      } ],
      "description" : "description",
      "title" : "title",
      "url" : "url",
      "dashboardAssetsDetails" : {
        "share" : 2.3021358869347655
      },
      "personalDetails" : {
        "canCloseProgram" : true,
        "canWithdraw" : true,
        "canInvest" : true,
        "isFollowSignals" : true,
        "canClosePeriod" : true,
        "canReallocate" : true,
        "pendingOutput" : 3.5571952270680973,
        "hasNotifications" : true,
        "pendingInput" : 6.438423552598547,
        "isOwnProgram" : true,
        "possibleReallocationTime" : "2000-01-23T04:56:07.000+00:00",
        "isFinishing" : true,
        "canMakeSignalProvider" : true,
        "value" : 6.683562403749608,
        "profit" : 8.762042012749001,
        "withdrawPercent" : 9.369310271410669,
        "invested" : 9.018348186070783,
        "isFavorite" : true,
        "isInvested" : true,
        "status" : "Pending"
      },
      "logo" : "logo",
      "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
      "chart" : [ {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      }, {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      } ],
      "status" : "None"
    }, {
      "totalAssetsCount" : 7,
      "statistic" : {
        "balanceGVT" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "profitPercent" : 4.965218492984954,
        "drawdownPercent" : 5.025004791520295,
        "balanceSecondary" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "investorsCount" : 9
      },
      "color" : "color",
      "manager" : {
        "registrationDate" : "2000-01-23T04:56:07.000+00:00",
        "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
        "avatar" : "avatar",
        "url" : "url",
        "username" : "username"
      },
      "topFundAssets" : [ {
        "name" : "name",
        "icon" : "icon",
        "asset" : "asset",
        "percent" : 1.1730742509559433
      }, {
        "name" : "name",
        "icon" : "icon",
        "asset" : "asset",
        "percent" : 1.1730742509559433
      } ],
      "description" : "description",
      "title" : "title",
      "url" : "url",
      "dashboardAssetsDetails" : {
        "share" : 2.3021358869347655
      },
      "personalDetails" : {
        "canCloseProgram" : true,
        "canWithdraw" : true,
        "canInvest" : true,
        "isFollowSignals" : true,
        "canClosePeriod" : true,
        "canReallocate" : true,
        "pendingOutput" : 3.5571952270680973,
        "hasNotifications" : true,
        "pendingInput" : 6.438423552598547,
        "isOwnProgram" : true,
        "possibleReallocationTime" : "2000-01-23T04:56:07.000+00:00",
        "isFinishing" : true,
        "canMakeSignalProvider" : true,
        "value" : 6.683562403749608,
        "profit" : 8.762042012749001,
        "withdrawPercent" : 9.369310271410669,
        "invested" : 9.018348186070783,
        "isFavorite" : true,
        "isInvested" : true,
        "status" : "Pending"
      },
      "logo" : "logo",
      "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
      "chart" : [ {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      }, {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      } ],
      "status" : "None"
    } ]
  },
  "programs" : {
    "total" : 6,
    "programs" : [ {
      "periodDuration" : 6,
      "statistic" : {
        "balanceBase" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "tradesCount" : 7,
        "balanceGVT" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "profitPercent" : 1.4658129805029452,
        "profitValue" : 5.962133916683182,
        "drawdownPercent" : 5.637376656633329,
        "currentValue" : 6.027456183070403,
        "balanceSecondary" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "investorsCount" : 2
      },
      "color" : "color",
      "manager" : {
        "registrationDate" : "2000-01-23T04:56:07.000+00:00",
        "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
        "avatar" : "avatar",
        "url" : "url",
        "username" : "username"
      },
      "level" : 0,
      "stopOutLevel" : 1.4658129805029452,
      "availableInvestment" : 5.962133916683182,
      "rating" : {
        "rating" : 7,
        "canLevelUp" : true,
        "topPercent" : 3.616076749251911,
        "profit" : 9.301444243932576
      },
      "description" : "description",
      "title" : "title",
      "availableInvestmentBase" : 5.637376656633329,
      "url" : "url",
      "periodStarts" : "2000-01-23T04:56:07.000+00:00",
      "tags" : [ {
        "color" : "color",
        "name" : "name"
      }, {
        "color" : "color",
        "name" : "name"
      } ],
      "dashboardAssetsDetails" : {
        "share" : 2.3021358869347655
      },
      "periodEnds" : "2000-01-23T04:56:07.000+00:00",
      "personalDetails" : {
        "canCloseProgram" : true,
        "canWithdraw" : true,
        "canInvest" : true,
        "isFollowSignals" : true,
        "canClosePeriod" : true,
        "pendingOutput" : 1.4894159098541704,
        "hasNotifications" : true,
        "pendingInput" : 1.0246457001441578,
        "isOwnProgram" : true,
        "isReinvest" : true,
        "gvtValue" : 2.027123023002322,
        "isFinishing" : true,
        "canMakeSignalProvider" : true,
        "value" : 4.145608029883936,
        "profit" : 7.386281948385884,
        "invested" : 1.2315135367772556,
        "isFavorite" : true,
        "isInvested" : true,
        "status" : "Pending"
      },
      "logo" : "logo",
      "currency" : "BTC",
      "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
      "chart" : [ {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      }, {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      } ],
      "status" : "None"
    }, {
      "periodDuration" : 6,
      "statistic" : {
        "balanceBase" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "tradesCount" : 7,
        "balanceGVT" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "profitPercent" : 1.4658129805029452,
        "profitValue" : 5.962133916683182,
        "drawdownPercent" : 5.637376656633329,
        "currentValue" : 6.027456183070403,
        "balanceSecondary" : {
          "amount" : 0.8008281904610115,
          "currency" : "BTC"
        },
        "investorsCount" : 2
      },
      "color" : "color",
      "manager" : {
        "registrationDate" : "2000-01-23T04:56:07.000+00:00",
        "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
        "avatar" : "avatar",
        "url" : "url",
        "username" : "username"
      },
      "level" : 0,
      "stopOutLevel" : 1.4658129805029452,
      "availableInvestment" : 5.962133916683182,
      "rating" : {
        "rating" : 7,
        "canLevelUp" : true,
        "topPercent" : 3.616076749251911,
        "profit" : 9.301444243932576
      },
      "description" : "description",
      "title" : "title",
      "availableInvestmentBase" : 5.637376656633329,
      "url" : "url",
      "periodStarts" : "2000-01-23T04:56:07.000+00:00",
      "tags" : [ {
        "color" : "color",
        "name" : "name"
      }, {
        "color" : "color",
        "name" : "name"
      } ],
      "dashboardAssetsDetails" : {
        "share" : 2.3021358869347655
      },
      "periodEnds" : "2000-01-23T04:56:07.000+00:00",
      "personalDetails" : {
        "canCloseProgram" : true,
        "canWithdraw" : true,
        "canInvest" : true,
        "isFollowSignals" : true,
        "canClosePeriod" : true,
        "pendingOutput" : 1.4894159098541704,
        "hasNotifications" : true,
        "pendingInput" : 1.0246457001441578,
        "isOwnProgram" : true,
        "isReinvest" : true,
        "gvtValue" : 2.027123023002322,
        "isFinishing" : true,
        "canMakeSignalProvider" : true,
        "value" : 4.145608029883936,
        "profit" : 7.386281948385884,
        "invested" : 1.2315135367772556,
        "isFavorite" : true,
        "isInvested" : true,
        "status" : "Pending"
      },
      "logo" : "logo",
      "currency" : "BTC",
      "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
      "chart" : [ {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      }, {
        "date" : "2000-01-23T04:56:07.000+00:00",
        "value" : 3.616076749251911
      } ],
      "status" : "None"
    } ]
  },
  "managers" : {
    "total" : 1,
    "managers" : [ {
      "assets" : [ "assets", "assets" ],
      "about" : "about",
      "regDate" : "2000-01-23T04:56:07.000+00:00",
      "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
      "avatar" : "avatar",
      "url" : "url",
      "username" : "username"
    }, {
      "assets" : [ "assets", "assets" ],
      "about" : "about",
      "regDate" : "2000-01-23T04:56:07.000+00:00",
      "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
      "avatar" : "avatar",
      "url" : "url",
      "username" : "username"
    } ]
  }
}}]
     
     - parameter mask: (query)  (optional)
     - parameter take: (query)  (optional)

     - returns: RequestBuilder<SearchViewModel> 
     */
    open class func v10SearchGetWithRequestBuilder(mask: String? = nil, take: Int? = nil) -> RequestBuilder<SearchViewModel> {
        let path = "/v1.0/search"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "mask": mask, 
            "take": take?.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<SearchViewModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
