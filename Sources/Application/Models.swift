//
//  Models.swift
//  Application
//
//  Created by Chris Bailey on 08/11/2017.
//

import Foundation
import Credentials
import CredentialsHTTP

public struct ToDo: Codable {
    let item: String
}

public class User: UserProfile {
    
    override public class func createCredentials() -> Credentials {
        print("User createCredentials")
        let credentials = Credentials()
        let users = ["John" : "12345", "Mary" : "qwerasdf"]
        let basicCredentials = CredentialsHTTPBasic(verifyPassword: { userId, password, callback in
            print("checking auth")
            if let storedPassword = users[userId], storedPassword == password {
                callback(UserProfile(id: userId, displayName: userId, provider: "HTTPBasic"))
            } else {
                callback(nil)
            }
        })
        credentials.register(plugin: basicCredentials)
        return credentials
    }
    
    
}
