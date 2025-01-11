class Validators {
  static String? checkEmailValidity(String? email) {
    if (email != null) {
      bool emailValidity = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);

      if (emailValidity) {
        return null;
      } else {
        return "Please enter a valid email";
      }
    } else {
      return "Please enter a valid email";
    }
  }

  static String? checkPasswordValidity(String? pass) {
    if (pass == null || pass == "") {
      return "Please enter a valid password";
    } else {
      return null;
    }
  }
}
