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


public enum Cognito {

    // MARK: Common Types

    public struct CallerContext: Codable {
        public let awsSdkVersion: String
        public let clientId: String
    }

    public enum ChallengeName: String, Codable {
        case ADMIN_NO_SRP_AUTH
        case CUSTOM_CHALLENGE
        case DEVICE_PASSWORD_VERIFIER
        case DEVICE_SRP_AUTH
        case PASSWORD_VERIFIER
        case SRP_A
        case SMS_MFA
    }

    public struct ChallengeResult: Codable {
        public let challengeName: ChallengeName
        public let challengeResult: Bool
        public let challengeMetadata: String?
    }

    public enum TriggerSource: String, Codable {
        case PreSignUp_SignUp
        case PreSignUp_AdminCreateUser
        case PreSignUp_ExternalProvider
        case PostConfirmation_ConfirmSignUp
        case PostConfirmation_ConfirmForgotPassword
        case PreAuthentication_Authentication
        case PostAuthentication_Authentication

        case DefineAuthChallenge_Authentication
        case CreateAuthChallenge_Authentication
        case VerifyAuthChallengeResponse_Authentication

        case TokenGeneration_HostedAuth
        case TokenGeneration_Authentication
        case TokenGeneration_NewPasswordChallenge
        case TokenGeneration_AuthenticateDevice
        case TokenGeneration_RefreshTokens

        case UserMigration_Authentication
        case UserMigration_ForgotPassword

        case CustomMessage_SignUp
        case CustomMessage_AdminCreateUser
        case CustomMessage_ResendCode
        case CustomMessage_ForgotPassword
        case CustomMessage_UpdateUserAttribute
        case CustomMessage_VerifyUserAttribute
        case CustomMessage_Authentication
    }
}


// MARK: -

#if swift(>=5.6)
extension Cognito.CallerContext: Sendable {}
extension Cognito.ChallengeName: Sendable {}
extension Cognito.ChallengeResult: Sendable {}
extension Cognito.TriggerSource: Sendable {}
#endif
