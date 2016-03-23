class Data {
    let key: String
    let name: String

    init(let _ data: Dictionary<String, AnyObject>) {
        let nameData = data["name"] as! Dictionary<String, String>

        key = data["key"] as! String
        name = nameData["ja_JP"]!
    }
}
