# language: pt

@regressivo @smoke
Funcionalidade: Cadastro de nova entrega
  Como usuário da API
  Quero cadastrar uma nova entrega
  Para que o registro seja salvo corretamente no sistema

  @padrao @smoke
  Cenário: Cadastro bem-sucedido de entrega
    Dado que eu tenha os seguintes dados da entrega:
      | campo          | valor        |
      | numeroPedido   | 1            |
      | nomeEntregador | Ana Silva    |
      | statusEntrega  | EM_SEPARACAO |
      | dataEntrega    | 2024-08-22   |
    Quando eu enviar a requisição para o endpoint "/entregas" de cadastro de entregas
    Então o status code da resposta deve ser 201

  Cenário: Cadastro de entregas sem sucesso ao enviar statusEntrega invalido
    Dado que eu tenha os seguintes dados da entrega:
      | campo          | valor        |
      | numeroPedido   | 1            |
      | nomeEntregador | Ana Silva    |
      | statusEntrega  | EM_VOO       |
      | dataEntrega    | 2024-08-22   |
    Quando eu enviar a requisição para o endpoint "/entregas" de cadastro de entregas
    Então o status code da resposta deve ser 400
    E a resposta de mensagem de erro deve ser "Dados fornecidos estão em formato inválido."