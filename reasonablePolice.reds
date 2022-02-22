  @wrapMethod(PreventionSystem)
  private final func GetSpawnDataFromHeatStage(heatStage: EPreventionHeatStage, out characterRecords: array<TweakDBID>, out spawnRange: Vector2, out unitsCount: Uint32, out spawnInterval: Float, out hasRecon: Bool) -> Bool {
    let wrap: Bool = wrappedMethod(heatStage, characterRecords, spawnRange, unitsCount, spawnInterval, hasRecon);

    spawnRange.X = spawnRange.X * 2.0;
    spawnRange.Y = spawnRange.Y * 2.0;
    return wrap;
  }
