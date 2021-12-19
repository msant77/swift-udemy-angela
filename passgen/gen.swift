enum CharacterType {
  case alphabet, upperAlphabet, numeric, special
}

struct SourceItem {
  var type: CharacterType = .alphabet
  var list: [String] = [""] 
}

let sourceAlphabet = SourceItem(
  type: .alphabet,
  list: ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"])
let sourceUpperAlphabet = SourceItem(
  type: .upperAlphabet,
  list: sourceAlphabet.list.map {$0.uppercased()})
let sourceNumeric = SourceItem(
  type: .numeric,
  list: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"])
let sourceSpecial = SourceItem(
  type: .special,
  list: ["!", "@", "#", "%", "&", "*", "£", "∞", "§", "¶", "•", "ª", "º", "¡"])

let source: [SourceItem] = [sourceAlphabet, sourceUpperAlphabet, sourceNumeric, sourceSpecial], defaultSize = 8

func get() -> String {
  let item: SourceItem = source.randomElement() ?? sourceNumeric
  return item.list.randomElement() ?? sourceNumeric.list[0]
}

var password = "", arguments: [String] = Array(CommandLine.arguments.dropFirst())

func generate() {
  if (arguments.isEmpty) { arguments.append(String(defaultSize)) }
  for _ in 1...(Int(arguments[0]) ?? defaultSize) {
    let character = get()
    password += character
  }
      
  print("\n", password, "\n")
}

generate()
