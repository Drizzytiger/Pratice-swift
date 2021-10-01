//
//  DatabaseManager.swift
//  MessengerApp
//
//  Created by Drake Ewing on 9/30/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()

    }
    
    extension DatabaseManager{
        
        public func userExists(with email: String, completion: @escaping((Bool) ->Void) ){
            
            var safeEmail = email.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            
            database.child(email).observeSingleEvent(of: .value, with: { snapshot in
                guard snapshot.value as? String != nil else{
                    completion(false)
                    return
                }
                completion(true)
            })
        }
        
        /// Insert new user to database
        public func insertUser(with user: ChatAppUser){
            database.child(user.safeEmail).setValue([
                "first_name": user.firstname,
                "last_name" : user.lastname
            ])
    }
    
    struct ChatAppUser{
        let firstname: String
        let lastname: String
        let emailAddress: String
        
        var safeEmail : String {
            var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            return safeEmail
        }
        
        //let profilePictureUrl:String
    }
}
