import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()

    public init() throws {
    }

    func postInit() throws {
        // Capabilities
        initializeMetrics(app: self)
        
        router.post("/", handler: authPost)
        router.get("/users") { (id: Int, respondWith: (Int?, RequestError?) -> Void) in
            respondWith(id, nil)
        }
        // Endpoints
        initializeHealthRoutes(app: self)
    
    }
        
    public func authPost(user: User, todo: ToDo, completion: (ToDo?, RequestError?) -> Void) -> Void {
        completion(todo, nil)
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}
