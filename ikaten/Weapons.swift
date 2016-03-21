class Weapons : DataCollection {
    init(let weapons: Array<Dictionary<String, AnyObject>>) {
        super.init()
        for weapon in weapons  {
            list.append(Weapon(data: weapon))
        }
    }

    func jaNameAtIndex(index: Int) -> String {
        let weapon = list[index] as! Weapon
        return weapon.name
    }
}
