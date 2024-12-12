import {
  ConflictException,
  HttpException,
  HttpStatus,
  Inject,
  Injectable,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { userEntity } from 'src/db/entities/user.entity';
import { Repository } from 'typeorm';
import { UsuarioDTO } from './usuario.dto';
import { hashSync as bcryptHashSync } from 'bcrypt';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsuarioService {
  constructor(
    @InjectRepository(userEntity)
    private readonly usersRepository: Repository<userEntity>,
  ) {}

  async create(newUser: UsuarioDTO) {
    const userAlreadyExists = await this.findByUsername(newUser.nome);

    if (userAlreadyExists) {
      throw new ConflictException(`User '${newUser.nome}' already registered`);
    }

    const dbUser = new userEntity();
    dbUser.nome = newUser.nome;
    dbUser.idade = newUser.idade;
    dbUser.lingua_nativa = newUser.lingua_nativa;
    dbUser.local = newUser.local;
    dbUser.email = newUser.email;
    dbUser.login = newUser.login;
    dbUser.senha = bcryptHashSync(newUser.senha, 10);
    dbUser.imagem_de_perfil = newUser.imagem_de_perfil;

    const { id, nome } = await this.usersRepository.save(dbUser);

    return { id, nome };
  }

  async findByUsername(login: string): Promise<UsuarioDTO | null> {
    const userFound = await this.usersRepository.findOne({
      where: { login },
    });

    if (!userFound) return null;

    return {
      id: userFound.id,
      nome: userFound.nome,
      idade: userFound.idade,
      lingua_nativa: userFound.lingua_nativa,
      local: userFound.local,
      email: userFound.email,
      login: userFound.login,
      senha: userFound.senha,
      imagem_de_perfil: userFound.imagem_de_perfil,
    };
  }

  async delete(id: number) {
    console.log('deeu');
    const result = await this.usersRepository.delete(id);

    if (!result.affected) {
      throw new HttpException(
        `Task with id ${id} not found`,
        HttpStatus.I_AM_A_TEAPOT,
      );
    }
  }

  async read(email: string, senha: string): Promise<UsuarioDTO | null> {
    const userFound = await this.usersRepository.findOne({
      where: { email },
    });

    if (!userFound) return null;

    const isPasswordValid = await bcrypt.compare(senha, userFound.senha);

    if (!isPasswordValid) return null;

    return {
      id: userFound.id,
      nome: userFound.nome,
      idade: userFound.idade,
      lingua_nativa: userFound.lingua_nativa,
      local: userFound.local,
      email: userFound.email,
      login: userFound.login,
      senha: userFound.senha,
      imagem_de_perfil: userFound.imagem_de_perfil,
    };
  }
}
