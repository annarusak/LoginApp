import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthenticationService {
    
    public static let shared = AuthenticationService()
    
    private init() {}
    
    
    /// A method that creates a user in Firebase
    /// - Parameters:
    ///   - userRequest: information about user (username, email and password)
    ///   - completion: completion with two values (Bool, Error?) :
    ///   - Bool: determines whether user registration is successful
    ///   - Error?: users registration and saving in Firebase error
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void) {
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let database = Firestore.firestore()
            database.collection("users").document(resultUser.uid).setData([
                "username": username,
                "email": email
            ]) { error in
                if let error = error {
                    completion(false, error)
                    return
                }
                completion(true, nil)
            }
        }
    }
    
}
