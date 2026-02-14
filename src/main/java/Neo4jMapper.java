import org.neo4j.driver.*;
import org.neo4j.driver.exceptions.Neo4jException;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.regex.*;
import java.util.stream.Collectors;

/**
 * Java Project to Neo4j Graph Mapper - Direct Database Connection
 *
 * CONFIGURE BELOW (Lines 19-23)
 *
 * Compile: javac -cp "neo4j-java-driver-*.jar" Neo4jMapper.java
 * Run: java -cp ".:neo4j-java-driver-*.jar" Neo4jMapper
 * (Windows: java -cp ".;neo4j-java-driver-*.jar" Neo4jMapper)
 */
public class Neo4jMapper implements AutoCloseable {

    // ============================================================
    // CONFIGURE YOUR SETTINGS HERE
    // ============================================================
    private static final String PROJECT_PATH = "D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem";
    private static final String NEO4J_URI = "neo4j+s://7438c57f.databases.neo4j.io";
    private static final String NEO4J_USER = "neo4j";
    private static final String NEO4J_PASSWORD = "X_jSQpDmNCS7m9yKAdaaJgKbzjVuEKqYgDGASUs-j-Q";
    // ============================================================

    private static final Pattern PACKAGE_PATTERN = Pattern.compile("package\\s+([\\w.]+);");
    private static final Pattern CLASS_PATTERN = Pattern.compile(
            "(?:public\\s+)?(?:abstract\\s+)?(?:final\\s+)?(?:class|interface|enum)\\s+(\\w+)(?:\\s+extends\\s+([\\w.<>]+))?(?:\\s+implements\\s+([\\w.,\\s<>]+))?"
    );
    private static final Pattern IMPORT_PATTERN = Pattern.compile("import\\s+(?:static\\s+)?([\\w.]+)(?:\\.\\*)?;");
    private static final Pattern METHOD_PATTERN = Pattern.compile(
            "(?:public|private|protected)\\s+(?:static\\s+)?(?:final\\s+)?(?:synchronized\\s+)?(?:\\w+(?:<[^>]+>)?\\s+)?(?:\\[\\]\\s*)?(\\w+)\\s*\\([^)]*\\)"
    );
    private static final Pattern FIELD_PATTERN = Pattern.compile(
            "(?:private|protected|public)\\s+(?:static\\s+)?(?:final\\s+)?(?:transient\\s+)?(?:volatile\\s+)?(\\w+(?:<[^>]+>)?(?:\\[\\])?)\\s+(\\w+)\\s*[;=]"
    );
    private static final Pattern ANNOTATION_PATTERN = Pattern.compile("@(\\w+)");
    private static final Pattern AUTOWIRED_PATTERN = Pattern.compile("@Autowired[^;]*?\\b(\\w+)\\s+(\\w+)\\s*;");
    private static final Pattern INJECT_PATTERN = Pattern.compile("@Inject[^;]*?\\b(\\w+)\\s+(\\w+)\\s*;");
    private static final Pattern METHOD_CALL_PATTERN = Pattern.compile("\\b(\\w+)\\.\\w+\\(");
    private static final Pattern NEW_INSTANCE_PATTERN = Pattern.compile("new\\s+(\\w+)(?:<[^>]*>)?\\(");
    private static final Pattern THROWS_PATTERN = Pattern.compile("throws\\s+([\\w.,\\s]+)");
    private static final Pattern RETURN_TYPE_PATTERN = Pattern.compile("(?:public|private|protected)\\s+(?:static\\s+)?(\\w+(?:<[^>]+>)?)\\s+\\w+\\s*\\(");
    private static final Pattern CONSTRUCTOR_PATTERN = Pattern.compile("(?:public|private|protected)\\s+(\\w+)\\s*\\([^)]*\\)");

    static class JavaClass {
        String filePath;
        String fileName;
        String packageName = "";
        String className = "";
        String layer = "";
        String extendsClass = "";
        List<String> imports = new ArrayList<>();
        List<String> annotations = new ArrayList<>();
        List<String> methods = new ArrayList<>();
        List<String> interfaces = new ArrayList<>();
        Map<String, String> fields = new LinkedHashMap<>();

        // Additional relationship tracking
        List<String> dependencies = new ArrayList<>();      // @Autowired, @Inject
        List<String> methodCalls = new ArrayList<>();       // Method calls to other classes
        List<String> instantiations = new ArrayList<>();    // new ClassName()
        List<String> throwsExceptions = new ArrayList<>();  // throws declarations
        List<String> returnTypes = new ArrayList<>();       // Return types used
        List<String> innerClasses = new ArrayList<>();      // Inner classes
        Map<String, String> constructorParams = new LinkedHashMap<>(); // Constructor parameters
    }

    private final Driver driver;
    private List<JavaClass> classes = new ArrayList<>();
    private Map<String, JavaClass> classMap = new HashMap<>();

    public Neo4jMapper(String uri, String user, String password) {
        this.driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }

    @Override
    public void close() {
        driver.close();
    }

    public static void main(String[] args) {
        System.out.println("╔════════════════════════════════════════════════════════════╗");
        System.out.println("║   Java Project to Neo4j - Direct Database Import          ║");
        System.out.println("╚════════════════════════════════════════════════════════════╝");
        System.out.println();
        System.out.println("Project: " + PROJECT_PATH);
        System.out.println("Neo4j:   " + NEO4J_URI);
        System.out.println();

        // Validate paths
        File projectDir = new File(PROJECT_PATH);
        if (!projectDir.exists() || !projectDir.isDirectory()) {
            System.err.println("❌ ERROR: Invalid project path!");
            System.err.println("Update PROJECT_PATH in the code (line 21)");
            return;
        }

        try (Neo4jMapper mapper = new Neo4jMapper(NEO4J_URI, NEO4J_USER, NEO4J_PASSWORD)) {
            // Test connection
            System.out.print("🔌 Testing Neo4j connection... ");
            mapper.testConnection();
            System.out.println("✓ Connected!");

            // Analyze and import
            mapper.analyzeAndImport(PROJECT_PATH);

        } catch (Exception e) {
            System.err.println("❌ ERROR: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void testConnection() {
        try (Session session = driver.session()) {
            session.run("RETURN 1").consume();
        }
    }

    public void analyzeAndImport(String projectPath) throws IOException {
        System.out.println("\n🔍 Step 1: Analyzing Java files...\n");

        // Analyze all Java files
        Files.walk(Paths.get(projectPath))
                .filter(p -> p.toString().endsWith(".java"))
                .forEach(p -> {
                    try {
                        JavaClass jc = parseFile(p);
                        classes.add(jc);
                        if (!jc.className.isEmpty()) {
                            String fullName = jc.packageName.isEmpty() ? jc.className : jc.packageName + "." + jc.className;
                            classMap.put(fullName, jc);
                        }
                        System.out.println("  ✓ " + p.getFileName());
                    } catch (Exception e) {
                        System.err.println("  ✗ " + p.getFileName() + ": " + e.getMessage());
                    }
                });

        if (classes.isEmpty()) {
            System.err.println("\n❌ No Java files found!");
            return;
        }

        printStats();

        System.out.println("\n📊 Step 2: Importing to Neo4j...\n");

        clearDatabase();
        createConstraints();
        createFileNodes();
        createClassNodes();
        createMethodNodes();
        createFieldNodes();
        createRelationships();
        createLayerRelationships();

        printNeo4jStats();

        System.out.println("\n" + "═".repeat(60));
        System.out.println("✅ IMPORT COMPLETE!");
        System.out.println("═".repeat(60));
        System.out.println("\n🌐 Open Neo4j Browser: http://localhost:7474");
        System.out.println("\n📋 Try these queries:");
        System.out.println("  MATCH (n) RETURN n LIMIT 100");
        System.out.println("  MATCH (c:Class) RETURN c.layer, count(c)");
        System.out.println("  MATCH path=(c:Class)-[:USES_SERVICE|USES_REPOSITORY*]->() RETURN path");
        System.out.println();
    }

    private JavaClass parseFile(Path path) throws IOException {
        JavaClass jc = new JavaClass();
        jc.filePath = path.toString();
        jc.fileName = path.getFileName().toString();

        String content = new String(Files.readAllBytes(path));

        Matcher m = PACKAGE_PATTERN.matcher(content);
        if (m.find()) jc.packageName = m.group(1);

        m = CLASS_PATTERN.matcher(content);
        if (m.find()) {
            jc.className = m.group(1);
            if (m.group(2) != null) jc.extendsClass = m.group(2);
            if (m.group(3) != null) {
                for (String iface : m.group(3).split(",")) {
                    jc.interfaces.add(iface.trim());
                }
            }
        }

        jc.layer = detectLayer(jc.filePath, jc.className, content);

        // Extract imports
        m = IMPORT_PATTERN.matcher(content);
        while (m.find()) jc.imports.add(m.group(1));

        // Extract annotations
        m = ANNOTATION_PATTERN.matcher(content);
        while (m.find()) jc.annotations.add(m.group(1));

        // Extract methods
        m = METHOD_PATTERN.matcher(content);
        while (m.find()) {
            String method = m.group(1);
            if (!method.equals(jc.className)) jc.methods.add(method);
        }

        // Extract fields
        m = FIELD_PATTERN.matcher(content);
        while (m.find()) jc.fields.put(m.group(2), m.group(1));

        // Extract @Autowired dependencies
        m = AUTOWIRED_PATTERN.matcher(content);
        while (m.find()) {
            String depType = m.group(1);
            jc.dependencies.add(depType);
        }

        // Extract @Inject dependencies
        m = INJECT_PATTERN.matcher(content);
        while (m.find()) {
            String depType = m.group(1);
            jc.dependencies.add(depType);
        }

        // Extract method calls (e.g., objectName.method())
        m = METHOD_CALL_PATTERN.matcher(content);
        Set<String> calls = new HashSet<>();
        while (m.find()) {
            String varName = m.group(1);
            if (!varName.equals("this") && !varName.equals("super")) {
                calls.add(varName);
            }
        }
        jc.methodCalls.addAll(calls);

        // Extract new instantiations
        m = NEW_INSTANCE_PATTERN.matcher(content);
        Set<String> instances = new HashSet<>();
        while (m.find()) {
            instances.add(m.group(1));
        }
        jc.instantiations.addAll(instances);

        // Extract throws declarations
        m = THROWS_PATTERN.matcher(content);
        while (m.find()) {
            String[] exceptions = m.group(1).split(",");
            for (String ex : exceptions) {
                jc.throwsExceptions.add(ex.trim());
            }
        }

        // Extract return types
        m = RETURN_TYPE_PATTERN.matcher(content);
        Set<String> returns = new HashSet<>();
        while (m.find()) {
            String returnType = m.group(1);
            if (!returnType.equals("void") && !isPrimitiveType(returnType)) {
                returns.add(returnType);
            }
        }
        jc.returnTypes.addAll(returns);

        // Extract constructor parameters
        m = CONSTRUCTOR_PATTERN.matcher(content);
        while (m.find()) {
            if (m.group(1).equals(jc.className)) {
                String params = content.substring(m.end()).split("\\)")[0];
                extractParameterTypes(params, jc.constructorParams);
            }
        }

        return jc;
    }

    private boolean isPrimitiveType(String type) {
        return type.matches("int|long|double|float|boolean|byte|char|short|String|Object|List|Set|Map|Collection");
    }

    private void extractParameterTypes(String params, Map<String, String> paramMap) {
        if (params.trim().isEmpty()) return;
        String[] paramPairs = params.split(",");
        for (String pair : paramPairs) {
            String[] parts = pair.trim().split("\\s+");
            if (parts.length >= 2) {
                paramMap.put(parts[parts.length - 1], parts[parts.length - 2]);
            }
        }
    }

    private String detectLayer(String path, String className, String content) {
        String lower = path.toLowerCase() + " " + className.toLowerCase();

        if (content.contains("@Controller") || content.contains("@RestController")) return "Controller";
        if (content.contains("@Service")) return "Service";
        if (content.contains("@Repository")) return "Repository";
        if (content.contains("@Entity") || content.contains("@Document")) return "Model";
        if (content.contains("@Configuration")) return "Configuration";

        if (lower.contains("controller")) return "Controller";
        if (lower.contains("service")) return "Service";
        if (lower.contains("repository") || lower.contains("dao")) return "Repository";
        if (lower.contains("model") || lower.contains("entity")) return "Model";
        if (lower.contains("dto")) return "DTO";
        if (lower.contains("config")) return "Configuration";
        if (lower.contains("util") || lower.contains("helper")) return "Utility";
        if (lower.contains("exception")) return "Exception";

        return "Other";
    }

    private void printStats() {
        System.out.println("\n" + "═".repeat(60));
        System.out.println("📊 ANALYSIS RESULTS");
        System.out.println("═".repeat(60));
        System.out.println("Files analyzed:    " + classes.size());
        System.out.println("Classes found:     " + classMap.size());
        System.out.println("Total methods:     " + classes.stream().mapToInt(c -> c.methods.size()).sum());
        System.out.println("Total fields:      " + classes.stream().mapToInt(c -> c.fields.size()).sum());

        System.out.println("\nLayer Distribution:");
        classes.stream()
                .collect(Collectors.groupingBy(c -> c.layer, Collectors.counting()))
                .entrySet().stream()
                .sorted(Map.Entry.<String, Long>comparingByValue().reversed())
                .forEach(e -> System.out.printf("  %-15s: %d%n", e.getKey(), e.getValue()));
    }

    private void clearDatabase() {
        System.out.print("  🗑️  Clearing database... ");
        try (Session session = driver.session()) {
            session.writeTransaction(tx -> {
                tx.run("MATCH (n) DETACH DELETE n");
                return null;
            });
        }
        System.out.println("✓");
    }

    private void createConstraints() {
        System.out.print("  🔧 Creating constraints... ");
        try (Session session = driver.session()) {
            session.writeTransaction(tx -> {
                try {
                    tx.run("CREATE CONSTRAINT IF NOT EXISTS FOR (f:File) REQUIRE f.path IS UNIQUE");
                    tx.run("CREATE CONSTRAINT IF NOT EXISTS FOR (c:Class) REQUIRE c.fullName IS UNIQUE");
                } catch (Neo4jException e) {
                    // Constraints may already exist
                }
                return null;
            });
        }
        System.out.println("✓");
    }

    private void createFileNodes() {
        System.out.print("  📁 Creating File nodes... ");
        try (Session session = driver.session()) {
            for (JavaClass jc : classes) {
                session.writeTransaction(tx -> {
                    tx.run("CREATE (f:File {path: $path, name: $name, package: $package, layer: $layer})",
                            Values.parameters(
                                    "path", jc.filePath,
                                    "name", jc.fileName,
                                    "package", jc.packageName,
                                    "layer", jc.layer
                            ));
                    return null;
                });
            }
        }
        System.out.println("✓ (" + classes.size() + ")");
    }

    private void createClassNodes() {
        System.out.print("  🎯 Creating Class nodes... ");
        int count = 0;
        try (Session session = driver.session()) {
            for (JavaClass jc : classes) {
                if (jc.className.isEmpty()) continue;

                String fullName = jc.packageName.isEmpty() ? jc.className : jc.packageName + "." + jc.className;

                session.writeTransaction(tx -> {
                    tx.run("CREATE (c:Class {name: $name, fullName: $fullName, package: $package, layer: $layer, annotations: $annotations})",
                            Values.parameters(
                                    "name", jc.className,
                                    "fullName", fullName,
                                    "package", jc.packageName,
                                    "layer", jc.layer,
                                    "annotations", jc.annotations
                            ));
                    return null;
                });

                // Link File -> Class
                session.writeTransaction(tx -> {
                    tx.run("MATCH (f:File {path: $path}), (c:Class {fullName: $fullName}) CREATE (f)-[:CONTAINS]->(c)",
                            Values.parameters("path", jc.filePath, "fullName", fullName));
                    return null;
                });

                count++;
            }
        }
        System.out.println("✓ (" + count + ")");
    }

    private void createMethodNodes() {
        System.out.print("  ⚙️  Creating Method nodes... ");
        int count = 0;
        try (Session session = driver.session()) {
            for (JavaClass jc : classes) {
                if (jc.className.isEmpty()) continue;

                String fullName = jc.packageName.isEmpty() ? jc.className : jc.packageName + "." + jc.className;

                for (String method : jc.methods) {
                    session.writeTransaction(tx -> {
                        tx.run("MATCH (c:Class {fullName: $fullName}) " +
                                        "CREATE (m:Method {name: $method}) " +
                                        "CREATE (c)-[:HAS_METHOD]->(m)",
                                Values.parameters("fullName", fullName, "method", method));
                        return null;
                    });
                    count++;
                }
            }
        }
        System.out.println("✓ (" + count + ")");
    }

    private void createFieldNodes() {
        System.out.print("  📝 Creating Field nodes... ");
        int count = 0;
        try (Session session = driver.session()) {
            for (JavaClass jc : classes) {
                if (jc.className.isEmpty()) continue;

                String fullName = jc.packageName.isEmpty() ? jc.className : jc.packageName + "." + jc.className;

                for (Map.Entry<String, String> field : jc.fields.entrySet()) {
                    session.writeTransaction(tx -> {
                        tx.run("MATCH (c:Class {fullName: $fullName}) " +
                                        "CREATE (f:Field {name: $name, type: $type}) " +
                                        "CREATE (c)-[:HAS_FIELD]->(f)",
                                Values.parameters("fullName", fullName, "name", field.getKey(), "type", field.getValue()));
                        return null;
                    });
                    count++;
                }
            }
        }
        System.out.println("✓ (" + count + ")");
    }

    private void createRelationships() {
        System.out.print("  🔗 Creating relationships... ");
        int count = 0;
        try (Session session = driver.session()) {
            for (JavaClass jc : classes) {
                if (jc.className.isEmpty()) continue;

                String fullName = jc.packageName.isEmpty() ? jc.className : jc.packageName + "." + jc.className;

                // 1. IMPORTS relationships
                for (String imp : jc.imports) {
                    if (classMap.containsKey(imp)) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:IMPORTS]->(c2)",
                                    Values.parameters("source", fullName, "target", imp));
                            return null;
                        });
                        count++;
                    }
                }

                // 2. EXTENDS relationship
                if (!jc.extendsClass.isEmpty()) {
                    String extendsFullName = resolveClass(jc.extendsClass, jc.packageName);
                    if (extendsFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:EXTENDS]->(c2)",
                                    Values.parameters("source", fullName, "target", extendsFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 3. IMPLEMENTS relationships
                for (String iface : jc.interfaces) {
                    String ifaceFullName = resolveClass(iface, jc.packageName);
                    if (ifaceFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:IMPLEMENTS]->(c2)",
                                    Values.parameters("source", fullName, "target", ifaceFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 4. DEPENDS_ON relationships (@Autowired, @Inject)
                for (String dep : jc.dependencies) {
                    String depFullName = resolveClass(dep, jc.packageName);
                    if (depFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:DEPENDS_ON]->(c2)",
                                    Values.parameters("source", fullName, "target", depFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 5. INSTANTIATES relationships (new ClassName())
                for (String inst : jc.instantiations) {
                    String instFullName = resolveClass(inst, jc.packageName);
                    if (instFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:INSTANTIATES]->(c2)",
                                    Values.parameters("source", fullName, "target", instFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 6. THROWS relationships
                for (String exc : jc.throwsExceptions) {
                    String excFullName = resolveClass(exc, jc.packageName);
                    if (excFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:THROWS]->(c2)",
                                    Values.parameters("source", fullName, "target", excFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 7. RETURNS relationships
                for (String ret : jc.returnTypes) {
                    String retFullName = resolveClass(ret, jc.packageName);
                    if (retFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:RETURNS]->(c2)",
                                    Values.parameters("source", fullName, "target", retFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 8. USES_IN_CONSTRUCTOR relationships
                for (String paramType : jc.constructorParams.values()) {
                    String paramFullName = resolveClass(paramType, jc.packageName);
                    if (paramFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:USES_IN_CONSTRUCTOR]->(c2)",
                                    Values.parameters("source", fullName, "target", paramFullName));
                            return null;
                        });
                        count++;
                    }
                }

                // 9. HAS_FIELD_OF_TYPE relationships
                for (String fieldType : jc.fields.values()) {
                    String fieldFullName = resolveClass(fieldType, jc.packageName);
                    if (fieldFullName != null) {
                        session.writeTransaction(tx -> {
                            tx.run("MATCH (c1:Class {fullName: $source}), (c2:Class {fullName: $target}) " +
                                            "MERGE (c1)-[:HAS_FIELD_OF_TYPE]->(c2)",
                                    Values.parameters("source", fullName, "target", fieldFullName));
                            return null;
                        });
                        count++;
                    }
                }
            }
        }
        System.out.println("✓ (" + count + ")");
    }

    private void createLayerRelationships() {
        System.out.print("  🏗️  Creating layer relationships... ");
        try (Session session = driver.session()) {
            int count = 0;

            // Controller -> Service
            count += session.writeTransaction(tx -> {
                Result result = tx.run(
                        "MATCH (c:Class {layer:'Controller'})-[:IMPORTS]->(s:Class {layer:'Service'}) " +
                                "MERGE (c)-[:USES_SERVICE]->(s) " +
                                "RETURN count(*) as cnt"
                );
                return result.single().get("cnt").asInt();
            });

            // Service -> Repository
            count += session.writeTransaction(tx -> {
                Result result = tx.run(
                        "MATCH (s:Class {layer:'Service'})-[:IMPORTS]->(r:Class {layer:'Repository'}) " +
                                "MERGE (s)-[:USES_REPOSITORY]->(r) " +
                                "RETURN count(*) as cnt"
                );
                return result.single().get("cnt").asInt();
            });

            // Repository -> Model
            count += session.writeTransaction(tx -> {
                Result result = tx.run(
                        "MATCH (r:Class {layer:'Repository'})-[:IMPORTS]->(m:Class {layer:'Model'}) " +
                                "MERGE (r)-[:MANAGES]->(m) " +
                                "RETURN count(*) as cnt"
                );
                return result.single().get("cnt").asInt();
            });

            System.out.println("✓ (" + count + ")");
        }
    }

    private void printNeo4jStats() {
        System.out.println("\n" + "═".repeat(60));
        System.out.println("📈 NEO4J DATABASE STATISTICS");
        System.out.println("═".repeat(60));

        try (Session session = driver.session()) {
            Result result;

            System.out.println("\n📦 NODES:");
            result = session.run("MATCH (f:File) RETURN count(f) as count");
            System.out.println("  Files:         " + result.single().get("count").asLong());

            result = session.run("MATCH (c:Class) RETURN count(c) as count");
            System.out.println("  Classes:       " + result.single().get("count").asLong());

            result = session.run("MATCH (m:Method) RETURN count(m) as count");
            System.out.println("  Methods:       " + result.single().get("count").asLong());

            result = session.run("MATCH (f:Field) RETURN count(f) as count");
            System.out.println("  Fields:        " + result.single().get("count").asLong());

            System.out.println("\n🔗 RELATIONSHIPS:");
            result = session.run("MATCH ()-[r:IMPORTS]->() RETURN count(r) as count");
            System.out.println("  IMPORTS:                " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:EXTENDS]->() RETURN count(r) as count");
            System.out.println("  EXTENDS:                " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:IMPLEMENTS]->() RETURN count(r) as count");
            System.out.println("  IMPLEMENTS:             " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:DEPENDS_ON]->() RETURN count(r) as count");
            System.out.println("  DEPENDS_ON:             " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:INSTANTIATES]->() RETURN count(r) as count");
            System.out.println("  INSTANTIATES:           " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:THROWS]->() RETURN count(r) as count");
            System.out.println("  THROWS:                 " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:RETURNS]->() RETURN count(r) as count");
            System.out.println("  RETURNS:                " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:USES_IN_CONSTRUCTOR]->() RETURN count(r) as count");
            System.out.println("  USES_IN_CONSTRUCTOR:    " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:HAS_FIELD_OF_TYPE]->() RETURN count(r) as count");
            System.out.println("  HAS_FIELD_OF_TYPE:      " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:USES_SERVICE]->() RETURN count(r) as count");
            System.out.println("  USES_SERVICE:           " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:USES_REPOSITORY]->() RETURN count(r) as count");
            System.out.println("  USES_REPOSITORY:        " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r:MANAGES]->() RETURN count(r) as count");
            System.out.println("  MANAGES:                " + result.single().get("count").asLong());

            result = session.run("MATCH ()-[r]->() RETURN count(r) as count");
            System.out.println("\n  TOTAL RELATIONSHIPS:    " + result.single().get("count").asLong());
        }
    }

    private String resolveClass(String className, String currentPackage) {
        if (classMap.containsKey(className)) return className;

        String withPkg = currentPackage + "." + className;
        if (classMap.containsKey(withPkg)) return withPkg;

        for (String fullName : classMap.keySet()) {
            if (fullName.endsWith("." + className)) return fullName;
        }

        return null;
    }
}