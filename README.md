# Open Route Toledo

> Las fábricas de Damasco y Fez, las de Reims, Toula y Solingen, no han podido 
> jamás, ni hoy pueden semejar siquiera, el temple de nuestras espadas
> toledanas, y solo lo han conseguido, si acaso, en la falsa marca que de las
> toledanas hojas sacaron algunas de aquellas.
>
> - Rodríguez del Canto

Toledo is the central builder for the Protocol Buffers that define the
communication of the different componentes of Open Route.

## Philosophy 

The idea behind this repository is to provide a standard procedure to compile
source files for the protocol buffer api. All repositories that need to
provide/consume a service must use this repository to:

- Have access to the API definitions.
- Compile the respective client/server code.

Toledo provides protocol buffer compilation for all languages needed in the
project.

## Supported languages

Toledo is WIP, so currently the only supported languages are:
- Rust

This should be easly extensible.

## Usage

Type `make` and the source files will be generated under `/gen`.


