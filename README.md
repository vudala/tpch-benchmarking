# TPC-H Benchmarking

## Como usar


### Inicializando
Execute os seguintes comandos pra iniciar o serviço:
```bash
docker compose build
docker compose up
```

Espere até a aparecer 'All done!' no console, isso pode demorar um pouco.


### Executando as queries
Após isso, entre no container:

```bash
docker exec -ti postgres-bench bash
```

E você poderá executar as queries utilizando o cliente do PostgreSQL:

Exemplo:
```bash
psql -f /home/queries/q01.sql
```


## TODO
- Descobrir como obter os indicadores de performance das queries
- Automatizar a execução de todas as queries de uma vez
