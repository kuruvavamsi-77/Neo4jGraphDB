# Neo4jGraphDB

A Neo4j graph database project that uses **Cypher** queries and **Java** code to model, load, and query graph data.

## Tech stack

- **Neo4j** (Graph Database)
- **Cypher** (query language)
- **Java** (application / integration code)

## Getting started

### Prerequisites

- Neo4j installed locally **or** access to a Neo4j instance
- Java (JDK 17+ recommended) if you are running Java code in this repo

### Run Neo4j

If you are using Neo4j Desktop, create a DBMS and start it.

If you are using Docker:

```bash
docker run --name neo4j \
  -p7474:7474 -p7687:7687 \
  -e NEO4J_AUTH=neo4j/password \
  neo4j:latest
```

Then open:

- Neo4j Browser: http://localhost:7474

### Connect

- Bolt URI: `bolt://localhost:7687`
- Username: `neo4j`
- Password: `password`

> Update credentials/URI to match your environment.

## Repository structure

- `*.cypher` / `*.cql`: Cypher scripts for creating/loading/querying the graph
- `src/` (if present): Java source code

## Usage

1. Start Neo4j
2. Run the Cypher scripts in Neo4j Browser (or via `cypher-shell`)
3. Run the Java code (if applicable) to interact with the database

## Contributing

Contributions are welcome! Please open an issue or a pull request with your changes.

## License

Add a license file if you want to specify usage terms.
