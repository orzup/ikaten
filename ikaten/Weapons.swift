class Weapons : DataCollection {
    override init() {
        super.init()
    }

    override init(let _ params: Array<Dictionary<String, AnyObject>>) {
        super.init()
        for param in params {
            append(Weapon(param))
        }
    }

    override init(let _ data: Array<Data>){
        super.init()
        for datum in data {
            append(datum)
        }
    }
}
