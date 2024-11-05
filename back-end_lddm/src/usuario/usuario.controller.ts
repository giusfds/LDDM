import { Body ,Controller, Get, Post, Param } from '@nestjs/common';
import { UsuarioDTO } from './usuario.dto';
import { UsuarioService } from './usuario.service';

@Controller('usuario')
export class UsuarioController {
    constructor(private readonly usuarioService: UsuarioService){ }

    @Post('/create')
    create(@Body() usuario: UsuarioDTO){

        console.log(this.usuarioService.create(usuario));
    }

    @Get(':login/:senha')
    read(@Param('login') login: string, @Param('senha') senha: string){
        console.log(this.usuarioService.read(login, senha));
    }
}

