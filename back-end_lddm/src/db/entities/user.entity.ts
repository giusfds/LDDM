import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'user' })
export class userEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar' })
  nome: string;

  @Column({ type: 'varchar' })
  idade: number;

  @Column({ type: 'varchar' })
  lingua_nativa: string;

  @Column({ type: 'varchar' })
  local: string;

  @Column({ type: 'varchar' })
  email: string;

  @Column({ type: 'varchar' })
  login: string;

  @Column({ type: 'varchar' })
  senha: string;

  @Column({ type: 'varchar', name: 'imagem_de_perfil' })
  imagem_de_perfil: string;
}
