class FileManager {
    static let fileObj = FileManager()
    private init() {
        
    }
    
    func checkFileAccess(user: String) {
        if user == "apple.com" {
            print("access granted!")
        } else {
            print("access denied!")
        }
    }
}
let username = "apple.com"
let file = FileManager.fileObj
file.checkFileAccess(user: username)
