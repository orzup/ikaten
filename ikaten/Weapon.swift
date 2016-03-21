class Weapon : Data {
    init(let data: Dictionary<String, AnyObject>) {
        super.init()
        let nameData = data["name"] as! Dictionary<String, String>
        jaText = nameData["ja_JP"]!
        enText = nameData["en_US"]!
    }
}
