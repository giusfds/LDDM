import { ConfigService } from '@nestjs/config';
import {config} from 'dotenv';
import { DataSource, DataSourceOptions } from 'typeorm';
import { userEntity } from './entities/user.entity';

config();

const configService = new ConfigService();

const dataSourceOptions: DataSourceOptions = {
    type: 'sqlite',
    database: configService.get<string>('DATABASE_PATH') || 'database.sqlite',
    entities: [userEntity],
    migrations: [__dirname + '/migrations/**.ts'],
    synchronize: false
}

export default new DataSource(dataSourceOptions);