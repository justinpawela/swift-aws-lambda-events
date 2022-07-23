//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftAWSLambdaRuntime open source project
//
// Copyright (c) 2017-2022 Apple Inc. and the SwiftAWSLambdaRuntime project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftAWSLambdaRuntime project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//


public enum CognitoCustomAuth: Sendable {

    // MARK: Common Types

    public struct CallerContext: Codable, Sendable {
        public let awsSdkVersion: String
        public let clientId: String
    }

    public enum ChallengeName: String, Codable, Sendable {
        case admin_no_srp_auth = "ADMIN_NO_SRP_AUTH"
        case custom_challenge = "CUSTOM_CHALLENGE"
        case device_password_verifier = "DEVICE_PASSWORD_VERIFIER"
        case device_srp_auth = "DEVICE_SRP_AUTH"
        case password_verifier = "PASSWORD_VERIFIER"
        case sms_mfa = "SMS_MFA"

        case email_otp = "EMAIL_OTP"
        case mfa_setup = "MFA_SETUP"
        case new_password_required = "NEW_PASSWORD_REQUIRED"
        case password = "PASSWORD"
        case password_srp = "PASSWORD_SRP"
        case select_challenge = "SELECT_CHALLENGE"
        case select_mfa_type = "SELECT_MFA_TYPE"
        case software_token_mfa = "SOFTWARE_TOKEN_MFA"
        case sms_otp = "SMS_OTP"
        case web_authn = "WEB_AUTHN"

        case srp_a = "SRP_A"
    }

    public struct ChallengeResult: Codable, Sendable {
        public let challengeName: ChallengeName
        public let challengeResult: Bool
        public let challengeMetadata: String?
    }
}


extension CognitoCustomAuth {

    // MARK: Define Auth

    public struct DefineAuthEvent: Codable, Sendable {
        public struct Request: Codable, Sendable {
            public let clientMetadata: [String: String]?
            public let session: [ChallengeResult]
            public let userAttributes: [String: String]
            public let userNotFound: Bool
        }

        public struct Response: Codable, Sendable {
            public var challengeName: ChallengeName?
            public var failAuthentication: Bool?
            public var issueTokens: Bool?
        }

        public let request: Request
        public var response: Response

        public let callerContext: CallerContext
        public let region: AWSRegion
        public let triggerSource: CognitoEvent.TriggerSource
        public let userName: String
        public let userPoolId: String
        public let version: String
    }

    // MARK: Create Auth

    public struct CreateAuthEvent: Codable, Sendable {
        public struct Request: Codable, Sendable {
            public let challengeName: ChallengeName
            public let clientMetadata: [String: String]?
            public let session: [ChallengeResult]
            public let userAttributes: [String: String]
            public let userNotFound: Bool
        }

        public struct Response: Codable, Sendable {
            public var challengeMetadata: String?
            public var privateChallengeParameters: [String: String]?
            public var publicChallengeParameters: [String: String]?
        }

        public let request: Request
        public var response: Response

        public let callerContext: CallerContext
        public let region: AWSRegion
        public let triggerSource: CognitoEvent.TriggerSource
        public let userName: String
        public let userPoolId: String
        public let version: String
    }

    // MARK: Verify Auth

    public struct VerifyAuthEvent: Codable, Sendable {
        public struct Request: Codable, Sendable {
            public let challengeAnswer: String
            public let clientMetadata: [String: String]?
            public let privateChallengeParameters: [String: String]
            public let userAttributes: [String: String]
            public let userNotFound: Bool
        }

        public struct Response: Codable, Sendable {
            public var answerCorrect: Bool?
        }

        public let request: Request
        public var response: Response

        public let callerContext: CallerContext
        public let region: AWSRegion
        public let triggerSource: CognitoEvent.TriggerSource
        public let userName: String
        public let userPoolId: String
        public let version: String
    }
}
