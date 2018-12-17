//
// ProgramsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class ProgramsAPI {
    /**
     Program balance chart
     
     - parameter id: (path)  
     - parameter dateFrom: (query)  (optional)
     - parameter dateTo: (query)  (optional)
     - parameter maxPointCount: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsByIdChartsBalanceGet(id: UUID, dateFrom: Date? = nil, dateTo: Date? = nil, maxPointCount: Int? = nil, completion: @escaping ((_ data: ProgramBalanceChart?,_ error: Error?) -> Void)) {
        v10ProgramsByIdChartsBalanceGetWithRequestBuilder(id: id, dateFrom: dateFrom, dateTo: dateTo, maxPointCount: maxPointCount).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Program balance chart
     - GET /v1.0/programs/{id}/charts/balance
     - examples: [{contentType=application/json, example={
  "programCurrencyBalance" : 0.8008281904610115,
  "programCurrency" : "Undefined",
  "balanceChart" : [ {
    "date" : "2000-01-23T04:56:07.000+00:00",
    "investorsFunds" : 5.962133916683182,
    "profit" : 6.027456183070403,
    "managerFunds" : 1.4658129805029452
  }, {
    "date" : "2000-01-23T04:56:07.000+00:00",
    "investorsFunds" : 5.962133916683182,
    "profit" : 6.027456183070403,
    "managerFunds" : 1.4658129805029452
  } ],
  "gvtBalance" : 5.637376656633329
}}]
     
     - parameter id: (path)  
     - parameter dateFrom: (query)  (optional)
     - parameter dateTo: (query)  (optional)
     - parameter maxPointCount: (query)  (optional)

     - returns: RequestBuilder<ProgramBalanceChart> 
     */
    open class func v10ProgramsByIdChartsBalanceGetWithRequestBuilder(id: UUID, dateFrom: Date? = nil, dateTo: Date? = nil, maxPointCount: Int? = nil) -> RequestBuilder<ProgramBalanceChart> {
        var path = "/v1.0/programs/{id}/charts/balance"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "DateFrom": dateFrom?.encodeToJSON(), 
            "DateTo": dateTo?.encodeToJSON(), 
            "MaxPointCount": maxPointCount?.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<ProgramBalanceChart>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Program profit chart
     
     - parameter id: (path)  
     - parameter dateFrom: (query)  (optional)
     - parameter dateTo: (query)  (optional)
     - parameter maxPointCount: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsByIdChartsProfitGet(id: UUID, dateFrom: Date? = nil, dateTo: Date? = nil, maxPointCount: Int? = nil, completion: @escaping ((_ data: ProgramProfitChart?,_ error: Error?) -> Void)) {
        v10ProgramsByIdChartsProfitGetWithRequestBuilder(id: id, dateFrom: dateFrom, dateTo: dateTo, maxPointCount: maxPointCount).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Program profit chart
     - GET /v1.0/programs/{id}/charts/profit
     - examples: [{contentType=application/json, example={
  "profitFactor" : 7.386281948385884,
  "profitChangePercent" : 1.4894159098541704,
  "calmarRatio" : 1.1730742509559433,
  "timeframeGvtProfit" : 9.965781217890562,
  "timeframeProgramCurrencyProfit" : 3.616076749251911,
  "trades" : 2,
  "maxDrawdown" : 4.965218492984954,
  "equityChart" : [ {
    "date" : "2000-01-23T04:56:07.000+00:00",
    "value" : 3.616076749251911
  }, {
    "date" : "2000-01-23T04:56:07.000+00:00",
    "value" : 3.616076749251911
  } ],
  "investors" : 1,
  "totalGvtProfit" : 5.025004791520295,
  "sortinoRatio" : 7.457744773683766,
  "pnLChart" : [ {
    "date" : "2000-01-23T04:56:07.000+00:00",
    "value" : 3.616076749251911
  }, {
    "date" : "2000-01-23T04:56:07.000+00:00",
    "value" : 3.616076749251911
  } ],
  "balance" : 1.2315135367772556,
  "programCurrency" : "Undefined",
  "rate" : 9.369310271410669,
  "totalProgramCurrencyProfit" : 9.301444243932576,
  "successTradesPercent" : 4.145608029883936,
  "lastPeriodEnds" : "2000-01-23T04:56:07.000+00:00",
  "periods" : [ {
    "dateTo" : "2000-01-23T04:56:07.000+00:00",
    "dateFrom" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "dateTo" : "2000-01-23T04:56:07.000+00:00",
    "dateFrom" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "sharpeRatio" : 6.84685269835264,
  "lastPeriodStarts" : "2000-01-23T04:56:07.000+00:00"
}}]
     
     - parameter id: (path)  
     - parameter dateFrom: (query)  (optional)
     - parameter dateTo: (query)  (optional)
     - parameter maxPointCount: (query)  (optional)

     - returns: RequestBuilder<ProgramProfitChart> 
     */
    open class func v10ProgramsByIdChartsProfitGetWithRequestBuilder(id: UUID, dateFrom: Date? = nil, dateTo: Date? = nil, maxPointCount: Int? = nil) -> RequestBuilder<ProgramProfitChart> {
        var path = "/v1.0/programs/{id}/charts/profit"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "DateFrom": dateFrom?.encodeToJSON(), 
            "DateTo": dateTo?.encodeToJSON(), 
            "MaxPointCount": maxPointCount?.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<ProgramProfitChart>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Add to favorites
     
     - parameter id: (path)  
     - parameter authorization: (header) JWT access token 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsByIdFavoriteAddPost(id: UUID, authorization: String, completion: @escaping ((_ error: Error?) -> Void)) {
        v10ProgramsByIdFavoriteAddPostWithRequestBuilder(id: id, authorization: authorization).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     Add to favorites
     - POST /v1.0/programs/{id}/favorite/add
     
     - parameter id: (path)  
     - parameter authorization: (header) JWT access token 

     - returns: RequestBuilder<Void> 
     */
    open class func v10ProgramsByIdFavoriteAddPostWithRequestBuilder(id: UUID, authorization: String) -> RequestBuilder<Void> {
        var path = "/v1.0/programs/{id}/favorite/add"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)

        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Remove from favorites
     
     - parameter id: (path)  
     - parameter authorization: (header) JWT access token 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsByIdFavoriteRemovePost(id: UUID, authorization: String, completion: @escaping ((_ error: Error?) -> Void)) {
        v10ProgramsByIdFavoriteRemovePostWithRequestBuilder(id: id, authorization: authorization).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     Remove from favorites
     - POST /v1.0/programs/{id}/favorite/remove
     
     - parameter id: (path)  
     - parameter authorization: (header) JWT access token 

     - returns: RequestBuilder<Void> 
     */
    open class func v10ProgramsByIdFavoriteRemovePostWithRequestBuilder(id: UUID, authorization: String) -> RequestBuilder<Void> {
        var path = "/v1.0/programs/{id}/favorite/remove"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)

        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     * enum for parameter currencySecondary
     */
    public enum CurrencySecondary_v10ProgramsByIdGet: String { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case ada = "ADA"
        case usdt = "USDT"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case usd = "USD"
        case eur = "EUR"
    }

    /**
     Program details
     
     - parameter id: (path)  
     - parameter authorization: (header)  (optional)
     - parameter currencySecondary: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsByIdGet(id: String, authorization: String? = nil, currencySecondary: CurrencySecondary_v10ProgramsByIdGet? = nil, completion: @escaping ((_ data: ProgramDetailsFull?,_ error: Error?) -> Void)) {
        v10ProgramsByIdGetWithRequestBuilder(id: id, authorization: authorization, currencySecondary: currencySecondary).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Program details
     - GET /v1.0/programs/{id}
     - examples: [{contentType=application/json, example={
  "entryFee" : 1.4658129805029452,
  "periodDuration" : 6,
  "statistic" : {
    "profitFactorPercent" : 7.457744773683766,
    "investedAmount" : 1.0246457001441578,
    "startCurrency" : "Undefined",
    "tradesSuccessCount" : 6,
    "drawdownPercent" : 4.145608029883936,
    "balanceBase" : {
      "amount" : 5.962133916683182,
      "currency" : "Undefined"
    },
    "tradesCount" : 1,
    "hasNotifications" : true,
    "balanceGVT" : {
      "amount" : 5.962133916683182,
      "currency" : "Undefined"
    },
    "profitPercent" : 3.616076749251911,
    "investedCurrency" : "Undefined",
    "sharpeRatioPercent" : 1.1730742509559433,
    "profitValue" : 2.027123023002322,
    "currentValue" : 9.301444243932576,
    "startDate" : "2000-01-23T04:56:07.000+00:00",
    "startBalance" : 1.2315135367772556,
    "balanceSecondary" : {
      "amount" : 5.962133916683182,
      "currency" : "Undefined"
    },
    "investorsCount" : 7
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
  "entryFeeCurrent" : 5.637376656633329,
  "availableInvestment" : 7.061401241503109,
  "successFee" : 2.3021358869347655,
  "rating" : {
    "rating" : 4,
    "canLevelUp" : true,
    "topPercent" : 1.2315135367772556,
    "profit" : 7.386281948385884
  },
  "entryFeeSelected" : 5.962133916683182,
  "description" : "description",
  "isReinvesting" : true,
  "title" : "title",
  "personalProgramDetails" : {
    "canCloseProgram" : true,
    "canWithdraw" : true,
    "canInvest" : true,
    "canClosePeriod" : true,
    "pendingOutput" : 4.965218492984954,
    "hasNotifications" : true,
    "pendingInput" : 1.1730742509559433,
    "isOwnProgram" : true,
    "isReinvest" : true,
    "gvtValue" : 1.0246457001441578,
    "isFinishing" : true,
    "value" : 1.4894159098541704,
    "profit" : 6.84685269835264,
    "invested" : 7.457744773683766,
    "isFavorite" : true,
    "isInvested" : true,
    "status" : "Pending"
  },
  "url" : "url",
  "periodStarts" : "2000-01-23T04:56:07.000+00:00",
  "periodEnds" : "2000-01-23T04:56:07.000+00:00",
  "ipfsHash" : "ipfsHash",
  "logo" : "logo",
  "currency" : "Undefined",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "status" : "None"
}}]
     
     - parameter id: (path)  
     - parameter authorization: (header)  (optional)
     - parameter currencySecondary: (query)  (optional)

     - returns: RequestBuilder<ProgramDetailsFull> 
     */
    open class func v10ProgramsByIdGetWithRequestBuilder(id: String, authorization: String? = nil, currencySecondary: CurrencySecondary_v10ProgramsByIdGet? = nil) -> RequestBuilder<ProgramDetailsFull> {
        var path = "/v1.0/programs/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "currencySecondary": currencySecondary?.rawValue
        ])
        
        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<ProgramDetailsFull>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     * enum for parameter sorting
     */
    public enum Sorting_v10ProgramsByIdTradesGet: String { 
        case byDateAsk = "ByDateAsk"
        case byDateDesc = "ByDateDesc"
        case byTicketAsk = "ByTicketAsk"
        case byTicketDesc = "ByTicketDesc"
        case bySymbolAsk = "BySymbolAsk"
        case bySymbolDesc = "BySymbolDesc"
        case byDirectionAsk = "ByDirectionAsk"
        case byDirectionDesc = "ByDirectionDesc"
    }

    /**
     Trade history
     
     - parameter id: (path)  
     - parameter dateFrom: (query)  (optional)
     - parameter dateTo: (query)  (optional)
     - parameter symbol: (query)  (optional)
     - parameter sorting: (query)  (optional)
     - parameter skip: (query)  (optional)
     - parameter take: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsByIdTradesGet(id: UUID, dateFrom: Date? = nil, dateTo: Date? = nil, symbol: String? = nil, sorting: Sorting_v10ProgramsByIdTradesGet? = nil, skip: Int? = nil, take: Int? = nil, completion: @escaping ((_ data: TradesViewModel?,_ error: Error?) -> Void)) {
        v10ProgramsByIdTradesGetWithRequestBuilder(id: id, dateFrom: dateFrom, dateTo: dateTo, symbol: symbol, sorting: sorting, skip: skip, take: take).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Trade history
     - GET /v1.0/programs/{id}/trades
     - examples: [{contentType=application/json, example={
  "total" : 5,
  "trades" : [ {
    "volume" : 0.8008281904610115,
    "date" : "2000-01-23T04:56:07.000+00:00",
    "symbol" : "symbol",
    "entry" : "In",
    "ticket" : "ticket",
    "price" : 1.4658129805029452,
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "login" : "login",
    "profit" : 6.027456183070403,
    "direction" : "Buy"
  }, {
    "volume" : 0.8008281904610115,
    "date" : "2000-01-23T04:56:07.000+00:00",
    "symbol" : "symbol",
    "entry" : "In",
    "ticket" : "ticket",
    "price" : 1.4658129805029452,
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "login" : "login",
    "profit" : 6.027456183070403,
    "direction" : "Buy"
  } ]
}}]
     
     - parameter id: (path)  
     - parameter dateFrom: (query)  (optional)
     - parameter dateTo: (query)  (optional)
     - parameter symbol: (query)  (optional)
     - parameter sorting: (query)  (optional)
     - parameter skip: (query)  (optional)
     - parameter take: (query)  (optional)

     - returns: RequestBuilder<TradesViewModel> 
     */
    open class func v10ProgramsByIdTradesGetWithRequestBuilder(id: UUID, dateFrom: Date? = nil, dateTo: Date? = nil, symbol: String? = nil, sorting: Sorting_v10ProgramsByIdTradesGet? = nil, skip: Int? = nil, take: Int? = nil) -> RequestBuilder<TradesViewModel> {
        var path = "/v1.0/programs/{id}/trades"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "DateFrom": dateFrom?.encodeToJSON(), 
            "DateTo": dateTo?.encodeToJSON(), 
            "Symbol": symbol, 
            "Sorting": sorting?.rawValue, 
            "Skip": skip?.encodeToJSON(), 
            "Take": take?.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<TradesViewModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sorting
     */
    public enum Sorting_v10ProgramsGet: String { 
        case byLevelAsc = "ByLevelAsc"
        case byLevelDesc = "ByLevelDesc"
        case byProfitAsc = "ByProfitAsc"
        case byProfitDesc = "ByProfitDesc"
        case byDrawdownAsc = "ByDrawdownAsc"
        case byDrawdownDesc = "ByDrawdownDesc"
        case byTradesAsc = "ByTradesAsc"
        case byTradesDesc = "ByTradesDesc"
        case byInvestorsAsc = "ByInvestorsAsc"
        case byInvestorsDesc = "ByInvestorsDesc"
        case byNewDesc = "ByNewDesc"
        case byNewAsc = "ByNewAsc"
        case byEndOfPeriodAsc = "ByEndOfPeriodAsc"
        case byEndOfPeriodDesc = "ByEndOfPeriodDesc"
        case byTitleAsc = "ByTitleAsc"
        case byTitleDesc = "ByTitleDesc"
        case byBalanceAsc = "ByBalanceAsc"
        case byBalanceDesc = "ByBalanceDesc"
        case byCurrDesc = "ByCurrDesc"
        case byCurrAsc = "ByCurrAsc"
    }

    /**
     * enum for parameter programCurrency
     */
    public enum ProgramCurrency_v10ProgramsGet: String { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case ada = "ADA"
        case usdt = "USDT"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case usd = "USD"
        case eur = "EUR"
    }

    /**
     * enum for parameter currencySecondary
     */
    public enum CurrencySecondary_v10ProgramsGet: String { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case ada = "ADA"
        case usdt = "USDT"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case usd = "USD"
        case eur = "EUR"
    }

    /**
     Programs list
     
     - parameter authorization: (header)  (optional)
     - parameter levelMin: (query)  (optional)
     - parameter levelMax: (query)  (optional)
     - parameter profitAvgMin: (query)  (optional)
     - parameter profitAvgMax: (query)  (optional)
     - parameter sorting: (query)  (optional)
     - parameter programCurrency: (query)  (optional)
     - parameter currencySecondary: (query)  (optional)
     - parameter levelUpFrom: (query)  (optional)
     - parameter statisticDateFrom: (query)  (optional)
     - parameter statisticDateTo: (query)  (optional)
     - parameter chartPointsCount: (query)  (optional)
     - parameter mask: (query)  (optional)
     - parameter facetId: (query)  (optional)
     - parameter isFavorite: (query)  (optional)
     - parameter isEnabled: (query)  (optional)
     - parameter ids: (query)  (optional)
     - parameter managerId: (query)  (optional)
     - parameter programManagerId: (query)  (optional)
     - parameter skip: (query)  (optional)
     - parameter take: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsGet(authorization: String? = nil, levelMin: Int? = nil, levelMax: Int? = nil, profitAvgMin: Double? = nil, profitAvgMax: Double? = nil, sorting: Sorting_v10ProgramsGet? = nil, programCurrency: ProgramCurrency_v10ProgramsGet? = nil, currencySecondary: CurrencySecondary_v10ProgramsGet? = nil, levelUpFrom: Int? = nil, statisticDateFrom: Date? = nil, statisticDateTo: Date? = nil, chartPointsCount: Int? = nil, mask: String? = nil, facetId: String? = nil, isFavorite: Bool? = nil, isEnabled: Bool? = nil, ids: [UUID]? = nil, managerId: String? = nil, programManagerId: UUID? = nil, skip: Int? = nil, take: Int? = nil, completion: @escaping ((_ data: ProgramsList?,_ error: Error?) -> Void)) {
        v10ProgramsGetWithRequestBuilder(authorization: authorization, levelMin: levelMin, levelMax: levelMax, profitAvgMin: profitAvgMin, profitAvgMax: profitAvgMax, sorting: sorting, programCurrency: programCurrency, currencySecondary: currencySecondary, levelUpFrom: levelUpFrom, statisticDateFrom: statisticDateFrom, statisticDateTo: statisticDateTo, chartPointsCount: chartPointsCount, mask: mask, facetId: facetId, isFavorite: isFavorite, isEnabled: isEnabled, ids: ids, managerId: managerId, programManagerId: programManagerId, skip: skip, take: take).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Programs list
     - GET /v1.0/programs
     - examples: [{contentType=application/json, example={
  "total" : 9,
  "programs" : [ {
    "periodDuration" : 6,
    "statistic" : {
      "balanceBase" : {
        "amount" : 5.962133916683182,
        "currency" : "Undefined"
      },
      "tradesCount" : 2,
      "balanceGVT" : {
        "amount" : 5.962133916683182,
        "currency" : "Undefined"
      },
      "profitPercent" : 2.3021358869347655,
      "profitValue" : 7.061401241503109,
      "drawdownPercent" : 9.301444243932576,
      "currentValue" : 5.637376656633329,
      "balanceSecondary" : {
        "amount" : 5.962133916683182,
        "currency" : "Undefined"
      },
      "investorsCount" : 3
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
    "availableInvestment" : 1.4658129805029452,
    "rating" : {
      "rating" : 4,
      "canLevelUp" : true,
      "topPercent" : 1.2315135367772556,
      "profit" : 7.386281948385884
    },
    "description" : "description",
    "title" : "title",
    "url" : "url",
    "periodStarts" : "2000-01-23T04:56:07.000+00:00",
    "dashboardAssetsDetails" : {
      "share" : 5.025004791520295
    },
    "periodEnds" : "2000-01-23T04:56:07.000+00:00",
    "personalDetails" : {
      "canCloseProgram" : true,
      "canWithdraw" : true,
      "canInvest" : true,
      "canClosePeriod" : true,
      "pendingOutput" : 4.965218492984954,
      "hasNotifications" : true,
      "pendingInput" : 1.1730742509559433,
      "isOwnProgram" : true,
      "isReinvest" : true,
      "gvtValue" : 1.0246457001441578,
      "isFinishing" : true,
      "value" : 1.4894159098541704,
      "profit" : 6.84685269835264,
      "invested" : 7.457744773683766,
      "isFavorite" : true,
      "isInvested" : true,
      "status" : "Pending"
    },
    "logo" : "logo",
    "currency" : "Undefined",
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
        "amount" : 5.962133916683182,
        "currency" : "Undefined"
      },
      "tradesCount" : 2,
      "balanceGVT" : {
        "amount" : 5.962133916683182,
        "currency" : "Undefined"
      },
      "profitPercent" : 2.3021358869347655,
      "profitValue" : 7.061401241503109,
      "drawdownPercent" : 9.301444243932576,
      "currentValue" : 5.637376656633329,
      "balanceSecondary" : {
        "amount" : 5.962133916683182,
        "currency" : "Undefined"
      },
      "investorsCount" : 3
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
    "availableInvestment" : 1.4658129805029452,
    "rating" : {
      "rating" : 4,
      "canLevelUp" : true,
      "topPercent" : 1.2315135367772556,
      "profit" : 7.386281948385884
    },
    "description" : "description",
    "title" : "title",
    "url" : "url",
    "periodStarts" : "2000-01-23T04:56:07.000+00:00",
    "dashboardAssetsDetails" : {
      "share" : 5.025004791520295
    },
    "periodEnds" : "2000-01-23T04:56:07.000+00:00",
    "personalDetails" : {
      "canCloseProgram" : true,
      "canWithdraw" : true,
      "canInvest" : true,
      "canClosePeriod" : true,
      "pendingOutput" : 4.965218492984954,
      "hasNotifications" : true,
      "pendingInput" : 1.1730742509559433,
      "isOwnProgram" : true,
      "isReinvest" : true,
      "gvtValue" : 1.0246457001441578,
      "isFinishing" : true,
      "value" : 1.4894159098541704,
      "profit" : 6.84685269835264,
      "invested" : 7.457744773683766,
      "isFavorite" : true,
      "isInvested" : true,
      "status" : "Pending"
    },
    "logo" : "logo",
    "currency" : "Undefined",
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
}}]
     
     - parameter authorization: (header)  (optional)
     - parameter levelMin: (query)  (optional)
     - parameter levelMax: (query)  (optional)
     - parameter profitAvgMin: (query)  (optional)
     - parameter profitAvgMax: (query)  (optional)
     - parameter sorting: (query)  (optional)
     - parameter programCurrency: (query)  (optional)
     - parameter currencySecondary: (query)  (optional)
     - parameter levelUpFrom: (query)  (optional)
     - parameter statisticDateFrom: (query)  (optional)
     - parameter statisticDateTo: (query)  (optional)
     - parameter chartPointsCount: (query)  (optional)
     - parameter mask: (query)  (optional)
     - parameter facetId: (query)  (optional)
     - parameter isFavorite: (query)  (optional)
     - parameter isEnabled: (query)  (optional)
     - parameter ids: (query)  (optional)
     - parameter managerId: (query)  (optional)
     - parameter programManagerId: (query)  (optional)
     - parameter skip: (query)  (optional)
     - parameter take: (query)  (optional)

     - returns: RequestBuilder<ProgramsList> 
     */
    open class func v10ProgramsGetWithRequestBuilder(authorization: String? = nil, levelMin: Int? = nil, levelMax: Int? = nil, profitAvgMin: Double? = nil, profitAvgMax: Double? = nil, sorting: Sorting_v10ProgramsGet? = nil, programCurrency: ProgramCurrency_v10ProgramsGet? = nil, currencySecondary: CurrencySecondary_v10ProgramsGet? = nil, levelUpFrom: Int? = nil, statisticDateFrom: Date? = nil, statisticDateTo: Date? = nil, chartPointsCount: Int? = nil, mask: String? = nil, facetId: String? = nil, isFavorite: Bool? = nil, isEnabled: Bool? = nil, ids: [UUID]? = nil, managerId: String? = nil, programManagerId: UUID? = nil, skip: Int? = nil, take: Int? = nil) -> RequestBuilder<ProgramsList> {
        let path = "/v1.0/programs"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "LevelMin": levelMin?.encodeToJSON(), 
            "LevelMax": levelMax?.encodeToJSON(), 
            "ProfitAvgMin": profitAvgMin, 
            "ProfitAvgMax": profitAvgMax, 
            "Sorting": sorting?.rawValue, 
            "ProgramCurrency": programCurrency?.rawValue, 
            "CurrencySecondary": currencySecondary?.rawValue, 
            "LevelUpFrom": levelUpFrom?.encodeToJSON(), 
            "StatisticDateFrom": statisticDateFrom?.encodeToJSON(), 
            "StatisticDateTo": statisticDateTo?.encodeToJSON(), 
            "ChartPointsCount": chartPointsCount?.encodeToJSON(), 
            "Mask": mask, 
            "FacetId": facetId, 
            "IsFavorite": isFavorite, 
            "IsEnabled": isEnabled, 
            "Ids": ids, 
            "ManagerId": managerId, 
            "ProgramManagerId": programManagerId, 
            "Skip": skip?.encodeToJSON(), 
            "Take": take?.encodeToJSON()
        ])
        
        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<ProgramsList>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Level up summary
     
     - parameter authorization: (header)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsLevelupSummaryGet(authorization: String? = nil, completion: @escaping ((_ data: LevelUpSummary?,_ error: Error?) -> Void)) {
        v10ProgramsLevelupSummaryGetWithRequestBuilder(authorization: authorization).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Level up summary
     - GET /v1.0/programs/levelup/summary
     - examples: [{contentType=application/json, example={
  "levelData" : [ {
    "total" : 6,
    "level" : 0,
    "totalOwn" : 1,
    "quota" : 5,
    "targetProfit" : 5.637376656633329
  }, {
    "total" : 6,
    "level" : 0,
    "totalOwn" : 1,
    "quota" : 5,
    "targetProfit" : 5.637376656633329
  } ]
}}]
     
     - parameter authorization: (header)  (optional)

     - returns: RequestBuilder<LevelUpSummary> 
     */
    open class func v10ProgramsLevelupSummaryGetWithRequestBuilder(authorization: String? = nil) -> RequestBuilder<LevelUpSummary> {
        let path = "/v1.0/programs/levelup/summary"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)

        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<LevelUpSummary>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Programs sets
     
     - parameter authorization: (header) JWT access token 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func v10ProgramsSetsGet(authorization: String, completion: @escaping ((_ data: ProgramSets?,_ error: Error?) -> Void)) {
        v10ProgramsSetsGetWithRequestBuilder(authorization: authorization).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Programs sets
     - GET /v1.0/programs/sets
     - examples: [{contentType=application/json, example={
  "sets" : [ {
    "sortType" : "New",
    "description" : "description",
    "logo" : "logo",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "title" : "title",
    "url" : "url"
  }, {
    "sortType" : "New",
    "description" : "description",
    "logo" : "logo",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "title" : "title",
    "url" : "url"
  } ],
  "favoritesCount" : 0
}}]
     
     - parameter authorization: (header) JWT access token 

     - returns: RequestBuilder<ProgramSets> 
     */
    open class func v10ProgramsSetsGetWithRequestBuilder(authorization: String) -> RequestBuilder<ProgramSets> {
        let path = "/v1.0/programs/sets"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)

        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<ProgramSets>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

}
