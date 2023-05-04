//Función para enviar un e-mail de forma automatica a una dirección de correo definida.
void enviar_email_automatico(string asunto, string cuerpo, string archivo_adjunto = "")
{
  //Variables con la configuración de e-mail
  string smtp_host, smtp_user, smtp_pass;
  dyn_string email, direcciones_emails;
  int ret;
  bool useTLS;

  dpGet("configuracion_email.smtp.host", smtp_host,
        "configuracion_email.smtp.user", smtp_user,
        "configuracion_email.smtp.pass", smtp_pass,
        "configuracion_email.smtp.TLS", useTLS,
        "configuracion_email.direcciones_emails", direcciones_emails);

  //Se recorre el array con las direcciones de correos a los que se debe enviar el email
  for (int i = 1; i <= dynlen(direcciones_emails); i++)
  {
    email = makeDynString(direcciones_emails[i], smtp_user, asunto, cuerpo);
    sendMail(smtp_host, email, ret, smtp_user, smtp_pass, useTLS, archivo_adjunto);
  }
}

//Función para enviar un e-mail de forma manual.
void enviar_email(dyn_string direcciones_emails, string asunto, string cuerpo, string archivo_adjunto = "")
{
  //Variables con la configuración de e-mail

  string smtp_host, smtp_user, smtp_pass;
  dyn_string email;
  int ret;
  bool useTLS;

  dpGet("configuracion_email.smtp.host", smtp_host,
        "configuracion_email.smtp.user", smtp_user,
        "configuracion_email.smtp.pass", smtp_pass,
        "configuracion_email.smtp.TLS", useTLS);

  //Se recorre el array con los correos a los que se debe enviar el correo
  for (int i = 1; i <= dynlen(direcciones_emails); i++)
  {
    email = makeDynString(direcciones_emails[i], smtp_user, asunto, cuerpo);
    sendMail(smtp_host, email, ret, smtp_user, smtp_pass, useTLS, archivo_adjunto);
  }
}
