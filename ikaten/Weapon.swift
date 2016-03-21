class Weapon : Data {
    init(let _ data: Dictionary<String, AnyObject>) {
        super.init()
        let nameData = data["name"] as! Dictionary<String, String>
        name = nameData["ja_JP"]!
    }
}
