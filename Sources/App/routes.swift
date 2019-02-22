import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    
    router.get() { req in
        return "Welcome to Million Hairs!"
    }
    
    router.get("staff") { req in
        return "Meet our great team"
    }
    
    router.get("contact") { req in
        return "Get in touch with us"
    }
}
