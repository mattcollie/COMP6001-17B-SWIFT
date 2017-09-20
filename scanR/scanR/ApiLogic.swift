class ApiLogic {
    
    class var endpoint: String { return "" }

    typealias GetMethodHandler = (_: String?, _: Any?, _: Any?) -> Void

    private static func GetURL(type: String) -> Any {
        //let url = URL(string: "http://localhost:2344/api/" + type)!
        //return url
        return ""
    }

    internal static func GetRequest(response: GetMethodHandler) {
        //let url = GetURL(endpoint)
        //URLSession.shared.dataTask(with: url, completionHandler:  response).resume()
        response(endpoint, "", "")
    }

    internal static func GetRequest(id: Int64, response: GetMethodHandler) {
        //let url = GetURL(endpoint + "/" + id.ToString())
        //URLSession.shared.dataTask(with: url, completionHandler:  response).resume()
        response(endpoint, "", "")
    }

    public static func Get(response: GetMethodHandler) {
        GetRequest(response: response)
    }

    public static func Get(id: Int64, response: GetMethodHandler) {
        GetRequest(id: id, response: response)
    }
}

class StudentApi : ApiLogic {
    override class var endpoint: String { return "student" }

}

class TimeslotApi : ApiLogic {
    override class var endpoint: String { return "timeslot" }

}

struct Timeslot {
    var Id: Int64
    var Day: Int
    var Hour: Int
    var DurationMinutes: Int
    var ClassName: String
    var PaperName: String
    var ClassType: String
    var StudentId: Int64
}

struct Student {
    var StudentId: Int64
    var FirstName: String
    var LastName: String
    var BarcodeId: Int64?
}

TimeslotApi.Get(id: 2, response:  { (data, response, error) in
    if let data = data {
        print(data)
    }
})