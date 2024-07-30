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

E você poderá executar as queries utilizando o cliente do PostgreSQL.

Exemplo:
```bash
psql -f /home/queries/q01.sql
```

### Executando todas de uma vez e obtendo o tempo de execução de cada uma

```bash
source /home/run_all_queries.sh
```

- Tempo em ms
- Query 15 é dividido em 3 times, somar os 3
