import { MigrationInterface, QueryRunner } from 'typeorm';

export class User1730810307718 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE user (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nome varchar(255) NOT NULL,
                idade integer NOT NULL,
                lingua_nativa varchar(255) NOT NULL,
                local varchar(255) NOT NULL,
                email varchar(50) NOT NULL,
                login varchar(50) NOT NULL,
                senha varchar(50) NOT NULL,
                imagem_de_perfil varchar(100)
            )
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE IF EXISTS user;`);
  }
}
