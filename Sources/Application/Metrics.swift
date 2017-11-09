import LoggerAPI


func initializeMetrics(app: App) {
    do {
        Log.info("Initialized metrics.")
    } catch {
        Log.warning("Failed to initialize metrics: \(error)")
    }
}
