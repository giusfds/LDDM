import { Body, Controller, Delete, Get, Post, Param } from '@nestjs/common';
import { UsuarioDTO } from './usuario.dto';
import { UsuarioService } from './usuario.service';

@Controller('usuario')
export class UsuarioController {
  constructor(private readonly usuarioService: UsuarioService) {}

  @Post('/create')
  create(@Body() usuario: UsuarioDTO) {
    console.log(this.usuarioService.create(usuario));
  }

  @Get(':email/:senha')
  read(@Param('email') email: string, @Param('senha') senha: string) {
    return this.usuarioService.read(email, senha);
  }

  @Delete('/:id')
  remove(@Param('id') id: number) {
    console.log(id);
    return this.usuarioService.delete(id);
  }
}
