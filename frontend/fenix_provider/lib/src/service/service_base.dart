// Configuração base para serviços resta
class ServiceBase {
  static const _porta = '8080';
  static const _enderecoServidor = '192.168.18.7';
  static const _endpoint = _enderecoServidor + ':' + _porta;

  get endpoint => _endpoint;
}
