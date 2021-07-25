//
//  AuthManager.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 1/17/21.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: - PUBLIC
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        
        /*
         - Check if username is available
         - Check if email is available
         
         */
        DataBaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - Create account
                 - Insert account into database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil , result != nil else {
                        completion(false)
                        return
                    }
                    // Insert account into database
                    DataBaseManager.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted {
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
            else {
                completion(false)
                
            }
            
        }
        
    }
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)){
        
        if let email = email{
            // Email login
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil , error == nil else{
                    completion(false)
                    return
                    
                }
                completion(true)
            }
            
            
        }
        else if let username = username {
            // Username login
            Auth.auth().signIn(withCustomToken: username){ (authResult, error)
                in
                guard authResult != nil , error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }
    }
    
    public func logOut(completion: (Bool) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
        
    }
    
    
}



