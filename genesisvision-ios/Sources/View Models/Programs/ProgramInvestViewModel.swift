//
//  ProgramInvestViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 21.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import Foundation

final class ProgramInvestViewModel {
    // MARK: - Variables
    var title: String = "Invest"
    var investmentProgramId: String?
    
    private var router: ProgramInvestRouter!
    
    // MARK: - Init
    init(withRouter router: ProgramInvestRouter, investmentProgramId: String) {
        self.router = router
        self.investmentProgramId = investmentProgramId
    }
    
    // MARK: - Public methods
    func getAmountText(completion: @escaping (_ text: String) -> Void) {
        AuthManager.getBalance(completion: { (value) in
            completion(String(describing: "Balance: \(value) GVT"))
        })
    }
    
    // MARK: - Navigation
    func invest(with value: Double, completion: @escaping CompletionBlock) {
        apiInvest(with: value, completion: completion)
    }
    
    // MARK: - Private methods
    // MARK: - API
    private func apiInvest(with value: Double, completion: @escaping CompletionBlock) {
        guard let programId = investmentProgramId,
            let uuid = UUID(uuidString: programId),
            let token = AuthManager.authorizedToken
            else { return completion(.failure(reason: nil)) }
        
        let investModel = Invest(investmentProgramId: uuid, amount: value)
        
        InvestorAPI.apiInvestorInvestmentsInvestPost(authorization: token, model: investModel) { [weak self] (profileShortViewModel, error) in
            self?.responseHandler(profileShortViewModel, error: error, completion: completion)
        }
    }
    
    private func responseHandler(_ viewModel: ProfileShortViewModel?, error: Error?, completion: @escaping CompletionBlock) {
        guard let profileShortViewModel = viewModel else {
            return ErrorHandler.handleApiError(error: error, completion: completion)
        }
        
        AuthManager.saveProfileShort(viewModel: profileShortViewModel)

        completion(.success)
    }
}