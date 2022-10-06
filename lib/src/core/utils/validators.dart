class Validators {
  const Validators._();

  static String? cepValidator(String? cep) {
    String? errorText;

    if (cep != null) {
      if (cep.length != 10) {
        errorText = 'Formato de CEP inválido.';
      }
    }

    return errorText;
  }
}
