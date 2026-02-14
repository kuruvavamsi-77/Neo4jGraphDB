// ═══════════════════════════════════════════════════════════
// Useful Neo4j Cypher Queries
// Copy and paste these into Neo4j Browser
// ═══════════════════════════════════════════════════════════

// 1. View all nodes (limit 100)
MATCH (n) RETURN n LIMIT 100;

// 2. View MVC flow (Controller -> Service -> Repository -> Model)
MATCH path = (c:Class {layer:'Controller'})-[:USES_SERVICE]->(s:Class {layer:'Service'})
             -[:USES_REPOSITORY]->(r:Class {layer:'Repository'})-[:MANAGES]->(m:Class {layer:'Model'})
RETURN path LIMIT 50;

// 3. Find all Controllers
MATCH (c:Class {layer:'Controller'}) RETURN c.name, c.fullName;

// 4. Find classes with most dependencies
MATCH (c:Class)-[:IMPORTS]->(dep)
WITH c, count(dep) as dependencies
WHERE dependencies > 3
RETURN c.name, c.layer, dependencies
ORDER BY dependencies DESC;

// 5. Find circular dependencies
MATCH (c1:Class)-[:IMPORTS]->(c2:Class)-[:IMPORTS]->(c1)
RETURN c1.name, c2.name;

// 6. Find unused classes (no incoming dependencies)
MATCH (c:Class)
WHERE NOT (c)<-[:IMPORTS]-()
RETURN c.name, c.layer;

// 7. View specific class with all its details
// Replace 'YourClassName' with your actual class name
MATCH (c:Class {name:'YourClassName'})
OPTIONAL MATCH (c)-[:HAS_METHOD]->(m:Method)
OPTIONAL MATCH (c)-[:HAS_FIELD]->(f:Field)
OPTIONAL MATCH (c)-[:IMPORTS]->(dep:Class)
RETURN c.name, collect(DISTINCT m.name) as methods, 
       collect(DISTINCT f.name) as fields,
       collect(DISTINCT dep.name) as dependencies;

// 8. Find all Services and their Repositories
MATCH (s:Class {layer:'Service'})-[:USES_REPOSITORY]->(r:Class {layer:'Repository'})
RETURN s.name, collect(r.name) as repositories;

// 9. Count nodes by layer
MATCH (c:Class)
RETURN c.layer as Layer, count(c) as Count
ORDER BY Count DESC;

// 10. Find inheritance hierarchy
MATCH path = (c:Class)-[:EXTENDS*]->(parent)
RETURN path LIMIT 50;

// 11. Find layer violations (Controller directly using Repository)
MATCH (c:Class {layer:'Controller'})-[:IMPORTS]->(r:Class {layer:'Repository'})
RETURN c.name as Controller, r.name as Repository;

// 12. Find all methods in a specific class
// Replace 'YourClassName' with your actual class name
MATCH (c:Class {name:'YourClassName'})-[:HAS_METHOD]->(m:Method)
RETURN c.name, collect(m.name) as methods;

// 13. Export all classes as JSON
MATCH (c:Class)
RETURN c.name, c.layer, c.package
ORDER BY c.layer, c.name;

