package org.example;
 import java.util.Map;
 import java.util.concurrent.TimeUnit;
 import org.neo4j.driver.QueryConfig;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.GraphDatabase;

public class Main {

    public static void main(String... args) {

        // URI examples: "neo4j://localhost", "neo4j+s://xxx.databases.neo4j.io"
        final String dbUri = "neo4j+s://7438c57f.databases.neo4j.io";
        final String dbUser = "neo4j";
        final String dbPassword = "X_jSQpDmNCS7m9yKAdaaJgKbzjVuEKqYgDGASUs-j-Q";

        try (var driver = GraphDatabase.driver(dbUri, AuthTokens.basic(dbUser, dbPassword))) {
            driver.verifyConnectivity();
            System.out.println("Connection established.");


            var result = driver.executableQuery("""
                            CREATE (a:Person {name: $name})
                            CREATE (b:Person {name: $friendName})
                            CREATE (a)-[:KNOWS]->(b)
                            """)
                    .withParameters(Map.of("name", "Alice", "friendName", "David"))
                    .withConfig(QueryConfig.builder().withDatabase("neo4j").build())
                    .execute();

            // Summary information
            var summary = result.summary();
            System.out.printf("Created %d records in %d ms.%n",
                    summary.counters().nodesCreated(),
                    summary.resultAvailableAfter(TimeUnit.MILLISECONDS));
        }
    }
}