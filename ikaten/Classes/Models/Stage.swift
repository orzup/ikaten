class Stage : Data {
    // TODO: 本当は stat.ink からステージ一覧を取得してこのリストを作りたい気持ち
    private static let statInkKeys = [
        "アンチョビットゲームズ" : "anchovy",
        "アロワナモール" :         "arowana",
        "Bバスパーク" :            "bbass",
        "デカライン高架下" :       "dekaline",
        "ハコフグ倉庫" :           "hakofugu",
        "ヒラメが丘団地" :         "hirame",
        "ホッケふ頭" :             "hokke",
        "キンメダイ美術館" :       "kinmedai",
        "マヒマヒリゾート&スパ" :  "mahimahi",
        "マサバ海峡大橋" :         "masaba",
        "モンガラキャンプ場" :     "mongara",
        "モズク農園" :             "mozuku",
        "ネギトロ炭鉱" :           "negitoro",
        "シオノメ油田" :           "shionome",
        "ショッツル鉱山" :         "shottsuru",
        "タチウオパーキング" :     "tachiuo"
    ]

    init(let _ data: Dictionary<String, AnyObject>) {
        super.init()
        let nameData = data["name"] as! Dictionary<String, String>
        name = nameData["ja_JP"]!
        key = data["key"] as! String
    }

    func toStatInkKey() -> String {
        return Stage.statInkKeys[name]!
    }
}
