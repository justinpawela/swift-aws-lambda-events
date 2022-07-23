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


extension Cognito {

    // MARK: Define Auth

    public struct DefineAuthEvent: Codable {
        public struct Request: Codable {
            public let clientMetadata: [String: String]?
            public let session: [ChallengeResult]
            public let userAttributes: [String: String]
            public let userNotFound: Bool
        }

        public struct Response: Codable {
            public var challengeName: ChallengeName?
            public var failAuthentication: Bool?
            public var issueTokens: Bool?
        }

        public let request: Request
        public var response: Response

        public let callerContext: CallerContext
        public let region: AWSRegion
        public let triggerSource: TriggerSource
        public let userName: String
        public let userPoolId: String
        public let version: String
    }

    // MARK: Create Auth

    public struct CreateAuthEvent: Codable {
        public struct Request: Codable {
            public let challengeName: ChallengeName
            public let clientMetadata: [String: String]?
            public let session: [ChallengeResult]
            public let userAttributes: [String: String]
            public let userNotFound: Bool
        }

        public struct Response: Codable {
            public var challengeMetadata: String?
            public var privateChallengeParameters: [String: String]?
            public var publicChallengeParameters: [String: String]?
        }

        public let request: Request
        public var response: Response

        public let callerContext: CallerContext
        public let region: AWSRegion
        public let triggerSource: TriggerSource
        public let userName: String
        public let userPoolId: String
        public let version: String
    }

    // MARK: Verify Auth

    public struct VerifyAuthEvent: Codable {
        public struct Request: Codable {
            public let challengeAnswer: String
            public let clientMetadata: [String: String]?
            public let privateChallengeParameters: [String: String]
            public let userAttributes: [String: String]
            public let userNotFound: Bool
        }

        public struct Response: Codable {
            public var answerCorrect: Bool?
        }

        public let request: Request
        public var response: Response

        public let callerContext: CallerContext
        public let region: AWSRegion
        public let triggerSource: TriggerSource
        public let userName: String
        public let userPoolId: String
        public let version: String
    }
}


// MARK: -

#if swift(>=5.6)
extension Cognito.DefineAuthEvent: Sendable {}
extension Cognito.DefineAuthEvent.Request: Sendable {}
extension Cognito.DefineAuthEvent.Response: Sendable {}
extension Cognito.CreateAuthEvent: Sendable {}
extension Cognito.CreateAuthEvent.Request: Sendable {}
extension Cognito.CreateAuthEvent.Response: Sendable {}
extension Cognito.VerifyAuthEvent: Sendable {}
extension Cognito.VerifyAuthEvent.Request: Sendable {}
extension Cognito.VerifyAuthEvent.Response: Sendable {}
#endif
