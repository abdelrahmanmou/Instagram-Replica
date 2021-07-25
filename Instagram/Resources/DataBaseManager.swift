//
//  DataBaseManager.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 1/17/21.
//

import FirebaseDatabase
public class DataBaseManager {
    
    static let shared = DataBaseManager()
    private let database = Database.database().reference()
    
    
    // MARK: - PUBLIC
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        
        completion(true)
    }
    public func insertNewUser (with email: String, username: String, completion: @escaping (Bool) -> Void ) {
        
        database.child(email.safeDatabaseKey()).setValue(["Username": username])  { error, _ in
            if error == nil {
                // Succeeded
                completion(true)
                return
            }
            else {
                completion(false)
                return
            }
            
            
        }
    }
    
}
