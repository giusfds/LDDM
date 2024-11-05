import 'dart:convert';
import 'dart:io';

class Usuario {
  //---| Declarando as variáveis do Usuario |---

  int id = -1;
  String nome = " "; // Nome do usuario
  int idade = -1; // Idade do usuario
  String lingua = " "; // Língua do usuario
  String local = " "; // Endereço do usuario

  String email = " "; // Email do usuario
  String senha = " "; // Senha do usuario
  String login = " "; // Login do usuario
  String imagem = " "; // Link da foto do perfil

  //List<String> historico = ["a", "b", "c", "d", "e"]; // Seu histórico de línguas

  //---| Construtor |---
  Usuario(this.nome, this.idade, this.lingua, this.local, this.email, this.login, this.senha, this.imagem);

  //-----------------------------------------

  //---| GETs |---
  String getNome() => nome;
  int getIdade() => idade;
  String getLingua() => lingua;
  String getLocal() => local;
  String getEmail() => email;
  String getSenha() => senha;
  String getLogin() => login;
  String getImagem() => imagem;
  //List<String> getHistorico() => historico;

  //---| SETs |---
  void setNome(String nome) => this.nome = nome;
  void setIdade(int idade) => this.idade = idade;
  void setLingua(String lingua) => this.lingua = lingua;
  void setLocal(String local) => this.local = local;
  void setEmail(String email) => this.email = email;
  void setSenha(String senha) => this.senha = senha;
  void setLogin(String login) => this.login = login;
  void setImagem(String imagem) => this.imagem = imagem;
  //void setHistorico(List<String> historico) => this.historico = historico;

  //-------------------------------

  //---| MÉTODOS RELACIONADOS AO JSON |---

  //Pegando informações do JSON
  Future<void> fromJSON() async {
    // String que conterá o JSON.
    String conteudo = "";

    // Convertendo de JSON para String.
    final arquivo = File("jsonNome.json"); // Caminho do arquivo.

    // Lendo o arquivo como String e salvando em "conteudo"
    conteudo = await arquivo.readAsString();

    // Convertendo a String JSON em um Map
    final Map<String, dynamic> jsonData = jsonDecode(conteudo);

    // Atribuindo valores às propriedades do usuário a partir do Map
    nome = jsonData['nome'] ?? " ";
    idade = jsonData['idade'] ?? -1;
    lingua = jsonData['lingua_nativa'] ?? " ";
    local = jsonData['local'] ?? " ";
    email = jsonData['email'] ?? " ";
    login = jsonData['login'] ?? " ";
    senha = jsonData['senha'] ?? " ";
    imagem = jsonData['imagem_de_perfil'] ?? " ";
    //historico = List<String>.from(jsonData['historico'] ?? []);

    // Printando a String
    print("Usuário carregado: $nome, Idade: $idade, Local: $local");
  }

  //Retornando para o JSON como String.

  String toJSON() {
    final Map<String, dynamic> jsonData = {
      'nome': nome,
      'idade': idade,
      'lingua_nativa': lingua,
      'local': local,
      'email': email,
      'login': login,
      'senha': senha,
      'imagem_de_perfil': imagem,
    };

    return jsonEncode(jsonData);
  }

  //---| CRUD |---

}
