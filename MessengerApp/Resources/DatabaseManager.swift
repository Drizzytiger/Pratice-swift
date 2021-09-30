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
            
            database.child(email).observeSingleEvent(of: .value, with: { snapshot in
                guard let snapshot.value as? String != nil else{
                    completion(false)
                    return
                }
                completion(true)
            })
        }
        
        /// Insert new user to database
        public func insertUser(with user: ChatAppUser){
            database.child(user.emailAddress).setValue([
                "first_name": user.firstname,
                "last_name" : user.lastname
            ])
    }
    
    struct ChatAppUser{
        let firstname: String
        let lastname: String
        let emailAddress: String
        //let profilePictureUrl:String
    }
}
