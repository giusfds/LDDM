import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsuarioModule } from './usuario/usuario.module';
import { DbModule } from './db/db.module';

@Module({
  imports: [UsuarioModule, DbModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
