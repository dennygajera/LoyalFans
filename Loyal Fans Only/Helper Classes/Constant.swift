//
//  Constant.swift
//  Whislte
//
//  Created by Darshan Gajera on 5/14/18.
//  Copyright © 2020. All rights reserved.
//
import UIKit
struct GlobalConstants {
    static let APPNAME = "Golf"
    static let spreadSheetID = "15tuICf8aQrDcTJIi_7clfvNaVY00A-QdNQeL53Hf4Kg"
    static let apiKey = "AIzaSyC_AC3OMZwoYigZdvkbjMd55XmRpelLv4c"
    static let clientId = "787090180691-f0qc3v72uf2frqul8mr6o7s6nlsnvju0.apps.googleusercontent.com"
}

enum Storyboard: String {
    case main    = "Main"
    case Calendar    = "WWCalendarTimeSelector"
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum Color: String {
    case SliderSelction  = "0080ff"
    case SliderDefault  = "0048b1"
    
    case SliderTextSelection  = "ffffff"
    case SliderTextDefault  = "7887b5"
    
    case AppColorCode  = "F5306F"
    case SupporterColorCode  = "e9dae7"
    
    case errorRed  = "EA2E31"
    case errorGreen  = "5DC15D"
    
    case TransactionFailed  = "ff4e4e"
    case TransactionSuccess  = "00a71c"
    case TransactionPending  = "ffbf00"
    case WalletFailed  = "ff3b3b"
    
    case WhiteDarkMode  = "feffff"
    func color() -> UIColor {
        return UIColor.hexStringToUIColor(hex: self.rawValue)
    }
}

struct UserType {
    static let Host  = "host"
    static let Player  = "player"
}

enum Identifier: String {
    // Main Storyboard
    case ViewController = "ViewController"
    case signup = "SignupVC"
    case login = "LoginVC"
    case home = "HomeVC"
    case forgotPassword = "ForgotPasswordVC"
    case sendOtp = "SendOTPVC"
    
    //Tab bar
    case tab = "TabBar"
    
    //Tableview cell
    case HomeCell = "HomeCell"
    
}

struct TabbarIcon {
    static let Home = "icoHome"
    static let HomeSelected = "icoSelectedHome"
    
    static let Search = "icoSearch"
    static let SearchSelected = "icoSelectedSearch"
    
    static let Add = "icoAdd"
    static let AddSelected = "icoAdd"
    
    static let Notification = "icoNotification"
    static let NotificationSelected = "icoSelectedNotification"
    
    static let Profile = "icoNotification"
    static let ProfileSelected = "icoSelectedNotification"
}


struct FirebaseCollection {
    // Main Storyboard
    static let User  = "Users"
    static let Feedback  = "Feedback"
    static let Food  = "Food Vendors"
    static let Floor  = "Floor Plan"
    static let Exhibitor  = "Exhibit Vendors"
    static let Sponsors  = "Sponsors"
    static let Schedule  = "Schedule"
}

struct FirebaseLogEvent {
    static let Login  = "iOS_Login"
    static let ProfileAccept  = "iOS_ProfileAccept"
    static let BuyAddOn  = "iOS_BuyAddOn"
    static let UseSpeakOn  = "iOS_UseSpeakOn"
    static let UseReverse  = "iOS_UseReverse"
}

struct FirebaseLogParameter {
    static let loginUsername  = "loginUsername"
    static let loginUserFbID  = "loginUserFbID"
    static let acceptUsername  = "acceptUsername"
    static let acceptUserFbID  = "acceptUserFbID"
    static let addOnType  = "addOnType"
}

struct ErrorMesssages {
    static let emptyGameId = "Please enter Game ID!"
    static let emptyTicketId = "Please enter Ticket ID!"
    
    static let emptyPhone = "Please enter phone number"
    static let validPhone = "Please enter valid phone number"
    
    static let validOtp = "Please enter valid OTP"
    static let wrongOTP = "Please enter valid OTP"
    static let wrong = "Something Went Wrong!"
    static let EmptyGameName = "Please enter game name"
    static let TicketAlready = "Ticket ID already added"
    static let MultipleGame = "You can't play multiple game at a same time"
    static let AtleastOneTicket = "Add atleast one ticket"
    static let CreateAtleastOneTicket = "Create atleast one ticket"
    static let EmptyUsername = "Username must not be empty"
    static let EmptyEmail = "Email must not be empty"
    static let ValidEmail = "Please enter valid email."
    static let SelectGender = "Please select your gender"
    static let EmptyDateofbirth = "Please enter date of birth."
}

struct SuccessMessages {
    static let TicketBogusSuccessfully = "Ticket declared bogus."
    static let TicketNumberCopied = "Ticket number copied."
    static let ForcefullyUpdate = "New version is available in app store, Please update app for better experiece"
}
