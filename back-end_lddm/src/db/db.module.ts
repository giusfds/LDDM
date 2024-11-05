import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
    imports: [ConfigModule.forRoot({isGlobal: true}),TypeOrmModule.forRootAsync({
        imports: [ConfigModule],
        useFactory: async(configService: ConfigService) => ({
                type: 'sqlite',
                database: configService.get<string>('DATABASE_PATH') || 'database.sqlite',
                entities: [__dirname + '/entities/**'],
                migrations: [__dirname + '/migrations/**.ts'],
                synchronize: false,
        }),
        inject: [ConfigService]
    })]
})
export class DbModule {}
