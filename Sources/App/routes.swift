import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    
    router.get() { req -> Future<View> in
        let context: [String: String] = [:]
        return try req.view().render("home", context)
    }
    
    router.get("contact") { req -> Future<View> in
        let context: [String: String] = [:]
        return try req.view().render("contact", context)
    }
    
    router.get("staff", String.parameter) { req -> Future<View> in
        let name = try req.parameters.next(String.self)
        
        let context: StaffView
        
        if let bio = StaffView.bios[name] {
            context = StaffView(name: name, bio: bio)
        } else {
            context = StaffView()
        }
        
        return try req.view().render("staff", context)
    }
}




struct StaffView: Codable {
    var name: String?
    var bio: String?
    let allNames = StaffView.bios.keys.sorted()
    
    static let bios = [
        "kirk": "My name is James Kirk and I love snakes",
        "picard": "My name is Jean-Luc Picard and I'm mad for fish.",
        "sisko": "My name is Benjamin Sisko and I'm all about the budgies.",
        "janeway": "My name is Kathryn Janeway and I want to hug every hamster.",
        "archer": "My name is Jonathan Archer and beagles are my thing."
    ]
}
