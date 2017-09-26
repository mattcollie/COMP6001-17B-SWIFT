import Foundation

class ApiLogic {
    
    class var endpoint: String { return "" }

    typealias GetMethodHandler = (_: Data?, _: URLResponse?, _: Error?) -> Void

    private static func GetURL(type: String) -> URL {
        let url = URL(string: "http://mattc.cloudfast.co/api/" + type)!
        return url
    }

    internal static func GetRequest(response:  @escaping GetMethodHandler) {
        let url = GetURL(type: endpoint)
        let task = URLSession.shared.dataTask(with: url, completionHandler: response)
        task.resume()
    }

    internal static func GetRequest(extra: String, response: @escaping GetMethodHandler) {
        let url = GetURL(type: endpoint + "/" + extra)
        let task = URLSession.shared.dataTask(with: url, completionHandler: response)
        task.resume()
    }

    internal static func GetResult(response: @escaping GetMethodHandler) {
        GetRequest(response: response)
    }

    internal static func GetResult(id: Int64, response: @escaping GetMethodHandler) {
        GetRequest(extra: String(id), response: response)
    }
    
    internal static func HttpPost(jsonData: String, response: @escaping GetMethodHandler) {
        if !jsonData.isEmpty {
            var request = URLRequest(url: GetURL(type: endpoint))
            request.httpMethod = "POST"
            request.httpBody = jsonData.data(using: .utf8)
            
            URLSession.shared.getAllTasks { (openTasks: [URLSessionTask]) in
                NSLog("open tasks: \(openTasks)")
            }
            URLSession.shared.dataTask(with: request, completionHandler: response).resume()
        }
    }
}

class StudentApi : ApiLogic {
    override class var endpoint: String { return "student" }

    typealias GetStudentMethod = (_: [Student]?, _: URLResponse?) -> Void
    public static func Get(response: @escaping GetStudentMethod) {
        GetResult(response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let students: [Student] = []
                response(students, urlResponse)
            }
        })
    }
    
    typealias GetByStudentMethod = (_: Student?, _: URLResponse?) -> Void
    public static func GetByStudentId(id: Int64, response: @escaping GetByStudentMethod) {
        GetResult(id: id, response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let student = Student(json: json)
                response(student, urlResponse)
            }
        })
    }
    
    typealias GetByBarcodeMethod = (_: Student?, _: URLResponse?) -> Void
    public static func GetByBarcode(id: Int64, response: @escaping GetByBarcodeMethod) {
        GetRequest(extra: "barcode/" + String(id), response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let student = Student(json: json)
                response(student, urlResponse)
            }
        })
    }
}

class TimeslotApi : ApiLogic {
    override class var endpoint: String { return "timeslot" }

    typealias GetTimeslotsByStudentMethod = (_: [Timeslot]?, _: URLResponse?) -> Void
    public static func GetTimeslotsByStudentId(id: Int64, response: @escaping GetTimeslotsByStudentMethod) {
        GetResult(id: id, response: {(data, urlResponse, error) -> Void in
            var timeslots: [Timeslot] = []
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                for case let result in json! {
                    if let timeslot = Timeslot(json: result as! [String : String]) {
                        timeslots.append(timeslot)
                    }
                }
                response(timeslots, urlResponse)
            }
        })
    }
    
    public static func UpdateTimeslot(timeslot: Timeslot) {
        HttpPost(jsonData: timeslot.toJSON()!, response: {(data, urlResponse, error) -> Void in
            
        })
    }
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
    
    init?(json: [String: String]) {
        guard let id = Int64(json["id"]!),
            let day = Int(json["day"]!),
            let hour = Int(json["hour"]!),
            let durationminutes = Int(json["durationminutes"]!),
            let className = json["classname"],
            let paperName = json["papername"],
            let classType = json["classtype"],
            let studentId = Int64(json["studentid"]!) else { return nil }
        
        Id = id
        Day = day
        Hour = hour
        DurationMinutes = durationminutes
        ClassName = className
        PaperName = paperName
        ClassType = classType
        StudentId = studentId
    }
        
    
    func toJSON() -> String? {
        let props: [String: Any?] = [
            "Id": Id,
            "Day": Day,
            "Hour": Hour,
            "DurationMinutes": DurationMinutes,
            "ClassName": ClassName,
            "PaperName": PaperName,
            "StudentId": StudentId
        ]
        return ""
        do {
            //let jsonData = try JSONSerialization.dataWithJSONObject(props, options: .PrettyPrinted)
            //return String(data, jsonData, encoding: NSUTF8StringEncoding)
        } catch let error {
            print("error converting to json: \(error)")
            return nil
        }
    }
}

struct Student {
    var StudentId: Int64
    var FirstName: String
    var LastName: String
    var BarcodeId: Int64?
    
    init?(json: [String: String]) {
        guard let studentId = Int64(json["studentid"]!),
            let firstName = json["firstname"],
            let lastName = json["lastname"],
            let barcodeId = Int64((json["barcodeid"])!) else { return nil }
        
        StudentId = studentId
        FirstName = firstName
        LastName = lastName
        BarcodeId = barcodeId
    }
}
