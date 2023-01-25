class RegexValidation{

  RegexValidation._internalConstructor();

  static final RegexValidation _instance = RegexValidation._internalConstructor();

  factory RegexValidation(){
    return _instance;
  }

  static bool isEmail(String text) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]").hasMatch(text);
  }

}