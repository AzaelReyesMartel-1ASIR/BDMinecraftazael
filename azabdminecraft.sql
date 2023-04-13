drop database if exists azabdminecraft;
create database azabdminecraft;
use azabdminecraft;
create table usuario (
id_usuario int not null,
nombre varchar(20) not null,
correo varchar(20) not null,
contraseña varchar(20) not null,
nombre_de_pila varchar(20) not null,
fecha_nacimiento date not null,
primary key (id_usuario)
);
create table item (
id_item int not null auto_increment,
ud_zanahoria int not null,
ud_cubo_leche int not null,
ud_pescao int not null,
ud_cubo_agua int not null,
id_usuario int not null,
primary key (id_item, id_usuario)
);
create table inventario (
id_inventario int not null auto_increment,
materiales varchar(20) not null ,
bloques varchar(20) not null,
armas varchar(20) not null,
comida varchar(20) not null,
id_usuario int not null,
primary key (id_inventario, id_usuario)
);
create table bloque (
id_bloque int not null auto_increment,
nombre varchar(20) not null,
tipo varchar(20) not null,
dureza varchar(20) not null,
primary key (id_bloque)
);
create table inventario_bloques (
id_bloque int not null,
id_inventario int not null,
primary key (id_bloque, id_inventario)
);
create table herramienta (
id_herramienta int not null auto_increment,
hacha varchar(20) not null,
pico varchar(20) not null,
espada varchar(20) not null,
pala varchar(20) not null,
azada varchar(20) not null,
primary key (id_herramienta)
);
create table bloques_herramientas (
id_bloque int not null,
id_herramienta int not null,
primary key (id_bloque, id_herramienta)
);
create table mundo (
id_mundo int not null auto_increment,
nombre varchar(20) not null,
tamaño varchar(20) not null,
semilla varchar(20) not null,
primary key (id_mundo)
);
create table bloque_mundo (
id_bloque int not null,
id_mundo int not null,
primary key (id_bloque, id_mundo)
);
create table usuario_mundo (
id_usuario int not null,
id_mundo int not null,
primary key (id_usuario, id_mundo)
);
create table biomas (
id_bioma int not null auto_increment,
nombre varchar(20) not null,
versión varchar(20) not null,
dificultad_descubrir varchar(20) not null,
mobs varchar(20) not null,
primary key (id_bioma)
);
create table mundo_biomas (
id_bioma int not null,
id_mundo int not null,
primary key (id_bioma, id_mundo)
);
create table dificultad (
id_dificultad int not null auto_increment,
modo_dificultad varchar(20) not null,
daño_recibido varchar(20) not null,
id_mundo int not null,
primary key (id_dificultad, id_mundo)
);

alter table item 
add constraint FK_id_usuario foreign key (id_usuario) references usuario (id_usuario);
alter table inventario
add constraint FK_id_usuario1 foreign key (id_usuario) references usuario (id_usuario);
alter table inventario_bloques
add constraint FK_id_inventario foreign key (id_inventario) references inventario (id_inventario),
add constraint FK_id_bloque foreign key (id_bloque) references bloque (id_bloque);
alter table bloques_herramientas
add constraint FK_id_bloque1 foreign key (id_bloque) references bloque (id_bloque),
add constraint FK_id_herramienta foreign key (id_herramienta) references herramienta (id_herramienta);
alter table bloque_mundo
add constraint FK_id_bloque2 foreign key (id_bloque) references bloque (id_bloque),
add constraint FK_id_mundo foreign key (id_mundo) references mundo (id_mundo);
alter table usuario_mundo
add constraint FK_id_usuario2 foreign key (id_usuario) references usuario (id_usuario),
add constraint FK_id_mundo1 foreign key (id_mundo) references mundo (id_mundo);
alter table mundo_biomas
add constraint FK_id_mundo2 foreign key (id_mundo) references mundo (id_mundo),
add constraint FK_id_bioma foreign key (id_bioma) references biomas (id_bioma);
alter table dificultad
add constraint FK_id_mundo3 foreign key (id_mundo) references mundo (id_mundo);

insert into usuario values (1, 'Azael', 'aza@gmail.com', 'pialcuadrado', 'aza', '2073-08-19');
insert into usuario values (2, 'JuanJosé', 'jj@gmail.com', 'miloko@nd@nte', 'JoséJuan', '2013-04-01');
insert into usuario values (3, 'Pablo', 'pablo@gmail.com', 'pablitosudosu', 'Melito', '2200-12-12');
insert into usuario values (4, 'Orlando', 'koki@gmail.com', 'kokisuperstar', 'koki', '2020-06-9');
insert into usuario values (5, 'Anya', 'an¡a@gmail.com', '@n¡@', 'an¡a', '2011-11-11');

insert into item values (1, 1, 3, 6, 0, 1);
insert into item values (2, 7, 7, 7, 10, 2);
insert into item values (3, 4, 1, 2, 4, 3);
insert into item values (4, 9, 11, 8, 12, 4);
insert into item values (5, 1, 5, 6, 8, 5);

insert into inventario values (1, 'piedra', 'bloque de diamante', 'arco encantado', 'pan', 1);
insert into inventario values (2, 'roca', 'bloque de hierro', 'pala de hierrp', 'kebab', 2);
insert into inventario values (3, 'madera', 'bloque de cobre', 'hacha rota', 'papa', 3);
insert into inventario values (4, 'palo', 'bloque de oro', 'none', 'atún', 4);
insert into inventario values (5, 'hilo', 'bloque de diamante', 'espada diamante', 'leche', 5);

insert into bloque values (1, 'piedra', 'normal', 'dura');
insert into bloque values (2, 'agua', 'cristalina', 'blanda');
insert into bloque values (3, 'bedrock', 'normal', 'indestructible');
insert into bloque values (4, 'madera', 'roble', 'intermedia');
insert into bloque values (5, 'diamante', 'normal', 'durísima');

insert into inventario_bloques values (1, 1);
insert into inventario_bloques values (2, 2);
insert into inventario_bloques values (3, 3);
insert into inventario_bloques values (4, 4);
insert into inventario_bloques values (5, 5);

insert into herramienta values (1, 'hacha de madera', 'pico de piedra', 'espada de hierro', 'pala de oro', 'azada de netherita');
insert into herramienta values (2, 'hacha de piedra', 'pico de oro', 'espada de netherita', 'pala de piedra', 'azada de diamante');
insert into herramienta values (3, 'hacha de diamante', 'pico de netherita', 'espada de madera', 'pala de diamante', 'azada de piedra');
insert into herramienta values (4, 'hacha de oro', 'pico de hierro', 'espada de diamante', 'pala de hierro', 'azada de hierro');
insert into herramienta values (5, 'hacha de hierro', 'pico de madera', 'espada de oro', 'pala de madera', 'azada de oro');

insert into bloques_herramientas values (1, 1);
insert into bloques_herramientas values (2, 2);
insert into bloques_herramientas values (3, 3);
insert into bloques_herramientas values (4, 4);
insert into bloques_herramientas values (5, 5);

insert into mundo values (1, 'Mundazo', 'pequeño', '16 -48');
insert into mundo values (2, 'Ayaya', 'diminuto', '32 368');
insert into mundo values (3, 'Frutitástico', 'normal', '168 408');
insert into mundo values (4, 'Cubilandia', 'extenso', '72 -51 -168');
insert into mundo values (5, 'ª', 'interminable', '-743 57');

insert into bloque_mundo values (1, 1);
insert into bloque_mundo values (2, 2);
insert into bloque_mundo values (3, 3);
insert into bloque_mundo values (4, 4);
insert into bloque_mundo values (5, 5);

insert into usuario_mundo values (1, 1);
insert into usuario_mundo values (2, 2);
insert into usuario_mundo values (3, 3);
insert into usuario_mundo values (4, 4);
insert into usuario_mundo values (5, 5);

insert into biomas values (1, 'Montañas de Taiga', 'Colinas de Taiga', 'Normal', 'zombis');
insert into biomas values (2, 'Desierto', 'Desierto', 'Normal', 'zombis_momia');
insert into biomas values (3, 'Pantano', 'Mangrove Swamp', 'Difícil', 'Bees');
insert into biomas values (4, 'Isla Setas', 'MushroomIsland', 'Medio', 'champivacas');
insert into biomas values (5, 'Nether', 'Netherlands', 'Difícil', 'Ghast');

insert into dificultad values (1, 'pacífico', 'x0', 1);
insert into dificultad values (2, 'fácil', 'x1', 2);
insert into dificultad values (3, 'normal', 'x2', 3);
insert into dificultad values (4, 'difícil', 'x4', 4);
insert into dificultad values (5, 'extrema', 'x6', 5);