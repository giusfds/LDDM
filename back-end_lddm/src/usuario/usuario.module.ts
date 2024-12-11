import { Module } from '@nestjs/common';
import { UsuarioController } from './usuario.controller';
import { UsuarioService } from './usuario.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { userEntity } from 'src/db/entities/user.entity';

@Module({
  controllers: [UsuarioController],
  imports: [TypeOrmModule.forFeature([userEntity])],
  providers: [UsuarioService],
})
export class UsuarioModule {}
