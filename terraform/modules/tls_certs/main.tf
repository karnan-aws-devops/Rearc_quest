resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "tls_cert" {
  private_key_pem = tls_private_key.tls_key.private_key_pem

  subject {
    common_name  = var.common_name
    organization = "Rearc"
  }

  validity_period_hours = 240

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "local_file" "cert_file" {
  content  = tls_self_signed_cert.tls_cert.cert_pem
  filename = "${path.module}/../../certs/selfsigned.crt"
}

resource "local_file" "key_file" {
  content  = tls_private_key.tls_key.private_key_pem
  filename = "${path.module}/../../certs/selfsigned.key"
}