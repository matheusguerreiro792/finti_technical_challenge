# Finti-Technical-Challenge

### Este README serve como um guia completo para configurar e rodar o projeto Desafio Tecnico da Finti utilizando Ruby on Rails.

## Descrição do Projeto
O projeto consiste em criar uma aplicação web usando **Ruby on Rails** para gerenciar cadastros de pessoas. Utiliza **PostgreSQL** como banco de dados e **Bootstrap** para estilização da interface. A aplicação permite calcular se a pessoa pode votar e determina o estado do número de celular com base no DDD.

### Pré-requisitos

- Ruby 3.3.7
- Rails 8.x
- PostgreSQL


### Instalação e Configuração

1. Clone o repositório:
   - git clone <URL_DO_REPOSITORIO>
   - cd <NOME_DO_DIRETORIO>


2. Instale as dependências:
   - bundle install


3. Configuração do Banco de Dados:
   - Edite o arquivo config/database.yml para definir suas credenciais de banco de dados:
     - username: finti
     - password: pass_finti_here-2025
  

**Nota:** _Você pode utilizar qualquer usuário já cadastrado como admin no PostgreSQL. Apenas lembre-se de substituir `username` e `password` no arquivo `database.yml` pelas suas credenciais._

4. Criação do banco de dados e execução das migrations:

```ruby
rails db:create
rails db:migrate
```


### Como Executar o Projeto

1. Inicie o servidor Rails:
   - rails server


2. Acesse a aplicação via browser:
   - Visite http://localhost:3000 para começar a utilizar a aplicação.



**Funcionalidades Principais**
- **Cadastro de Pessoa:** Interface para registrar uma nova pessoa com informações pessoais.
- **Validação de Voto:** Cálculo da elegibilidade para voto baseado na idade.
- **Identificação de Estado pelo DDD:** Integração com um serviço para determinar o estado correspondente ao DDD.


**Dependências**
- **Gem pg:** Necessária para a interação com o PostgreSQL.
- **Gem bootstrap:** Disponibiliza um framework CSS para design responsivo da interface.

**Estrutura do Código**
- **Modelos**: Incluem campos obrigatórios e métodos de verificação de voto e determinação de estado por DDD.
- **Controladores**: Gerenciam as ações do CRUD.
- **Visões**: Utilizam layouts Bootstrap para uma interface limpa e intuitiva.
