import FluentSQLite
import FluentMySQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
//    /// Register providers first
//    try services.register(FluentSQLiteProvider())
    
    try services.register(FluentMySQLProvider())
    
    var msqlMigrations = MigrationConfig()
    msqlMigrations.add(model: NewTodo.self, database: .mysql)
    services.register(msqlMigrations)

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

//    // Configure a SQLite database
//    let sqlite = try SQLiteDatabase(storage: .memory)

//    /// Register the configured SQLite database to the database config.
//    var databases = DatabasesConfig()
//    databases.add(database: sqlite, as: .sqlite)
//    services.register(databases)
    
    let mysql = MySQLDatabase(config: MySQLDatabaseConfig(hostname: "localhost", port: 3306, username: "root", password: "root", database: "vaportest", capabilities: .default, characterSet: .utf8mb4_unicode_ci, transport: .cleartext))
    var databases = DatabasesConfig()
    databases.add(database: mysql, as: .mysql)
    services.register(databases)

//    /// Configure migrations
//    var migrations = MigrationConfig()
//    migrations.add(model: Todo.self, database: .sqlite)
//    services.register(migrations)

}
