// ═══════════════════════════════════════════════════════════
// Neo4j Import Script - Java Project Graph
// Generated: Sat Feb 14 11:32:44 IST 2026
// Project: D:\Java-Backend\DoctorAppointmentSystem\DoctorAppointmentSystem\src\main\java\com\OnlineDoctorAppointmentSystem\DoctorAppointmentSystem
// ═══════════════════════════════════════════════════════════

// Step 1: Clean existing data
MATCH (n) DETACH DELETE n;

// Step 2: Create constraints
CREATE CONSTRAINT IF NOT EXISTS FOR (f:File) REQUIRE f.path IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (c:Class) REQUIRE c.fullName IS UNIQUE;

// Step 3: Create File nodes
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\AppointmentController.java', name:'AppointmentController.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\AuthController.java', name:'AuthController.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\demo.java', name:'demo.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\DoctorController.java', name:'DoctorController.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\PatientController.java', name:'PatientController.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\DoctorAppointmentSystemApplication.java', name:'DoctorAppointmentSystemApplication.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem', layer:'Other'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Appointment.java', name:'Appointment.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Doctor.java', name:'Doctor.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Patient.java', name:'Patient.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Student.java', name:'Student.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\UserEntity.java', name:'UserEntity.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Model\\StudentRequest.java', name:'StudentRequest.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Model\\UserModel.java', name:'UserModel.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model', layer:'Model'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\AppointmentRepo.java', name:'AppointmentRepo.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\DoctorRepo.java', name:'DoctorRepo.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\PatientRepo.java', name:'PatientRepo.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\testRepo.java', name:'testRepo.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\UserRepo.java', name:'UserRepo.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\AppointmentService.java', name:'AppointmentService.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\DoctorService.java', name:'DoctorService.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\LoginService.java', name:'LoginService.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\PatientService.java', name:'PatientService.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\RegisterService.java', name:'RegisterService.java', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});

// Step 4: Create Class nodes
CREATE (:Class {name:'AppointmentController', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:Class {name:'AuthController', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:Class {name:'demo', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.demo', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:Class {name:'DoctorController', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:Class {name:'PatientController', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.PatientController', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller', layer:'Controller'});
CREATE (:Class {name:'DoctorAppointmentSystemApplication', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.DoctorAppointmentSystemApplication', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem', layer:'Other'});
CREATE (:Class {name:'Appointment', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:Class {name:'Doctor', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:Class {name:'Patient', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:Class {name:'Student', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:Class {name:'UserEntity', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity', layer:'Model'});
CREATE (:Class {name:'StudentRequest', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model', layer:'Model'});
CREATE (:Class {name:'UserModel', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model', layer:'Model'});
CREATE (:Class {name:'AppointmentRepo', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.AppointmentRepo', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:Class {name:'DoctorRepo', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.DoctorRepo', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:Class {name:'PatientRepo', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.PatientRepo', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:Class {name:'testRepo', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.testRepo', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:Class {name:'UserRepo', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.UserRepo', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository', layer:'Repository'});
CREATE (:Class {name:'AppointmentService', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:Class {name:'DoctorService', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:Class {name:'LoginService', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.LoginService', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:Class {name:'PatientService', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});
CREATE (:Class {name:'RegisterService', fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService', package:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services', layer:'Service'});

// Step 5: Create Method nodes
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}) CREATE (m:Method {name:'bookAppointment'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}) CREATE (m:Method {name:'getAppointmentsById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}) CREATE (m:Method {name:'deleteAppointmentById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}) CREATE (m:Method {name:'getAppointmentByDoctorId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}) CREATE (m:Method {name:'Register'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}) CREATE (m:Method {name:'login'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.demo'}) CREATE (m:Method {name:'testSql'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController'}) CREATE (m:Method {name:'saveDoctor'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController'}) CREATE (m:Method {name:'getAllDoctors'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController'}) CREATE (m:Method {name:'getDoctorById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.PatientController'}) CREATE (m:Method {name:'updatePatient'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.PatientController'}) CREATE (m:Method {name:'getPatientById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.DoctorAppointmentSystemApplication'}) CREATE (m:Method {name:'main'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'getId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'setId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'getDoctorId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'setDoctorId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'getPatientId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'setPatientId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'getAppointmentDate'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'setAppointmentDate'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'getAppointmentTime'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'setAppointmentTime'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'getStatus'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (m:Method {name:'setStatus'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'getId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'setId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'getName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'setName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'getSpecialization'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'setSpecialization'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'getExperience'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'setExperience'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'getAvailability'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (m:Method {name:'setAvailability'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'getId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'setId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'getName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'setName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'getEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'setEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'getPhoneNumber'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'setPhoneNumber'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'getAddress'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (m:Method {name:'setAddress'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'getId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'setId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'getName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'setName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'getEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'setEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'getPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (m:Method {name:'setPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'getId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'setId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'getName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'setName'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'getEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'setEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'getPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'setPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'getRole'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (m:Method {name:'setRole'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (m:Method {name:'getUsername'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (m:Method {name:'setUsername'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (m:Method {name:'getPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (m:Method {name:'setPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (m:Method {name:'getEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (m:Method {name:'setEmail'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (m:Method {name:'getPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (m:Method {name:'setPassword'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}) CREATE (m:Method {name:'bookAppointment'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}) CREATE (m:Method {name:'getAppointmentsById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}) CREATE (m:Method {name:'deleteAppointmentById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}) CREATE (m:Method {name:'getAppointmentByDoctorId'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}) CREATE (m:Method {name:'saveDoctor'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}) CREATE (m:Method {name:'getAllDoctors'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}) CREATE (m:Method {name:'getDoctorById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.LoginService'}) CREATE (m:Method {name:'login'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}) CREATE (m:Method {name:'getPatientById'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}) CREATE (m:Method {name:'updatePatient'}) CREATE (c)-[:HAS_METHOD]->(m);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService'}) CREATE (m:Method {name:'registerUser'}) CREATE (c)-[:HAS_METHOD]->(m);

// Step 6: Create Field nodes
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f:Field {name:'id', type:'long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f:Field {name:'doctorId', type:'long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f:Field {name:'patientId', type:'long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f:Field {name:'appointmentDate', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f:Field {name:'appointmentTime', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f:Field {name:'status', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (f:Field {name:'id', type:'Long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (f:Field {name:'name', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (f:Field {name:'specialization', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (f:Field {name:'experience', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (f:Field {name:'Availability', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (f:Field {name:'id', type:'long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (f:Field {name:'name', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (f:Field {name:'email', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (f:Field {name:'phoneNumber', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (f:Field {name:'address', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (f:Field {name:'id', type:'Long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (f:Field {name:'name', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (f:Field {name:'email', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (f:Field {name:'password', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (f:Field {name:'id', type:'Long'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (f:Field {name:'name', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (f:Field {name:'email', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (f:Field {name:'password', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (f:Field {name:'role', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (f:Field {name:'username', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (f:Field {name:'password', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (f:Field {name:'email', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);
MATCH (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (f:Field {name:'password', type:'String'}) CREATE (c)-[:HAS_FIELD]->(f);

// Step 7: Create File-Class relationships
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\AppointmentController.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\AuthController.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\demo.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.demo'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\DoctorController.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Controller\\PatientController.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.PatientController'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\DoctorAppointmentSystemApplication.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.DoctorAppointmentSystemApplication'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Appointment.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Doctor.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Patient.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\Student.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Entity\\UserEntity.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Model\\StudentRequest.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Model\\UserModel.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\AppointmentRepo.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.AppointmentRepo'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\DoctorRepo.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.DoctorRepo'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\PatientRepo.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.PatientRepo'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\testRepo.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.testRepo'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Repository\\UserRepo.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.UserRepo'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\AppointmentService.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\DoctorService.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\LoginService.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.LoginService'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\PatientService.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}) CREATE (f)-[:CONTAINS]->(c);
MATCH (f:File {path:'D:\\Java-Backend\\DoctorAppointmentSystem\\DoctorAppointmentSystem\\src\\main\\java\\com\\OnlineDoctorAppointmentSystem\\DoctorAppointmentSystem\\Services\\RegisterService.java'}), (c:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService'}) CREATE (f)-[:CONTAINS]->(c);

// Step 8: Create IMPORTS relationships
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AppointmentController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.LoginService'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.AuthController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.demo'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.StudentRequest'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.DoctorController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.PatientController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Controller.PatientController'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.AppointmentRepo'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.DoctorRepo'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.PatientRepo'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.testRepo'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Student'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.UserRepo'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Appointment'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.AppointmentService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.AppointmentRepo'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Doctor'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.DoctorService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.DoctorRepo'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.LoginService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.LoginService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.UserRepo'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.Patient'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.PatientRepo'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.PatientService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.UserRepo'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Entity.UserEntity'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Model.UserModel'}) MERGE (c1)-[:IMPORTS]->(c2);
MATCH (c1:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Services.RegisterService'}), (c2:Class {fullName:'com.OnlineDoctorAppointmentSystem.DoctorAppointmentSystem.Repository.UserRepo'}) MERGE (c1)-[:IMPORTS]->(c2);

// Step 9: Create EXTENDS relationships

// Step 10: Create IMPLEMENTS relationships

// Step 11: Create MVC layer relationships
MATCH (c:Class {layer:'Controller'})-[:IMPORTS]->(s:Class {layer:'Service'}) MERGE (c)-[:USES_SERVICE]->(s);
MATCH (s:Class {layer:'Service'})-[:IMPORTS]->(r:Class {layer:'Repository'}) MERGE (s)-[:USES_REPOSITORY]->(r);
MATCH (r:Class {layer:'Repository'})-[:IMPORTS]->(m:Class {layer:'Model'}) MERGE (r)-[:MANAGES]->(m);

// ═══════════════════════════════════════════════════════════
// Import Complete! Run the queries in useful_queries.cypher
// ═══════════════════════════════════════════════════════════
