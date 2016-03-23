class Stages : DataCollection {
    override init() {
        super.init()
    }

    init(let _ params: Array<Dictionary<String, AnyObject>>) {
        super.init()
        for param in params {
            append(Stage(param))
        }
    }
}
