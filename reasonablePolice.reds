  @replaceMethod(PreventionSystem)
  private final func GetSpawnDataFromHeatStage(heatStage: EPreventionHeatStage, out characterRecords: array<TweakDBID>, out spawnRange: Vector2, out unitsCount: Uint32, out spawnInterval: Float, out hasRecon: Bool) -> Bool {
    let characterRecord: TweakDBID;
    let characterRecordPool: array<wref<PreventionUnitPoolData_Record>>;
    let heatData: wref<PreventionHeatData_Record>;
    let i: Int32;
    ArrayClear(characterRecords);
    if IsDefined(this.m_preventionPreset) {
      if !this.m_reconDeployed && NotEquals(heatStage, EPreventionHeatStage.Heat_0) {
        heatData = this.m_preventionPreset.Recon();
      };
      if !IsDefined(heatData) {
        switch heatStage {
          case EPreventionHeatStage.Heat_0:
            return false;
          case EPreventionHeatStage.Heat_1:
            heatData = this.m_preventionPreset.Heat1();
            break;
          case EPreventionHeatStage.Heat_2:
            heatData = this.m_preventionPreset.Heat2();
            break;
          case EPreventionHeatStage.Heat_3:
            heatData = this.m_preventionPreset.Heat3();
            break;
          case EPreventionHeatStage.Heat_4:
            heatData = this.m_preventionPreset.Heat4();
            break;
          default:
            return false;
        };
      } else {
        hasRecon = true;
      };
      if IsDefined(heatData) && heatData.GetUnitRecordsPoolCount() > 0 {
        heatData.UnitRecordsPool(characterRecordPool);
        unitsCount = Cast(heatData.UnitsCount());
        spawnRange = heatData.SpawnRange();
        spawnInterval = MaxF(heatData.SpawnInterval(), 0.00);
        i = 0;
        while i < Cast(unitsCount) {
          if this.GetCharacterRecordFromPool(characterRecordPool, characterRecord) {
            ArrayPush(characterRecords, characterRecord);
          } else {
            // goto 931;
          };
          i += 1;
        };
        if ArraySize(characterRecords) > 0 {

          // BEGIN PATCH
          spawnRange.X = spawnRange.X * 2.0;
          spawnRange.Y = spawnRange.Y * 2.0;
          // END PATCH

          return true;
        };
      };
    };
    switch heatStage {
      case EPreventionHeatStage.Heat_0:

        // BEGIN PATCH
        spawnRange.X = spawnRange.X * 2.0;
        spawnRange.Y = spawnRange.Y * 2.0;
        // END PATCH

        return false;
      case EPreventionHeatStage.Heat_1:
        ArrayPush(characterRecords, this.m_failsafePoliceRecordT1);
        unitsCount = 2u;
        spawnRange.Y = 45.00;
        spawnRange.Y = 65.00;
        break;
      case EPreventionHeatStage.Heat_2:
        ArrayPush(characterRecords, this.m_failsafePoliceRecordT2);
        unitsCount = 2u;
        spawnRange.Y = 45.00;
        spawnRange.Y = 65.00;
        break;
      case EPreventionHeatStage.Heat_4:
      case EPreventionHeatStage.Heat_3:
        ArrayPush(characterRecords, this.m_failsafePoliceRecordT3);
        unitsCount = 2u;
        spawnRange.Y = 45.00;
        spawnRange.Y = 65.00;
        break;
      default:
    };

    // BEGIN PATCH
    spawnRange.X = spawnRange.X * 2.0;
    spawnRange.Y = spawnRange.Y * 2.0;
    // END PATCH

    if ArraySize(characterRecords) > 0 {
      return true;
    };
    return false;



















/*
      if NotEquals(heatData, null) && heatData.GetUnitRecordsPoolCount() > 0 {
        heatData.UnitRecordsPool(characterRecordPool);
        unitsCount = Cast(heatData.UnitsCount());
        spawnRange = heatData.SpawnRange();
        spawnInterval = MaxF(heatData.SpawnInterval(), 0.00);
        // unitsCount = unitsCount * Cast(2);
        spawnRange.X = spawnRange.X * 5.0;
        spawnRange.Y = spawnRange.Y * 5.0;
        // spawnInterval = spawnInterval * 0.5;
        i = 0;
        while i < Cast(unitsCount) {
          if this.GetCharacterRecordFromPool(characterRecordPool, characterRecord) {
            ArrayPush(characterRecords, characterRecord);
          } else {
            // goto 889;
            i = Cast(unitsCount);
          };
          i += 1;
        };
        if ArraySize(characterRecords) > 0 {
          return true;
        };
      };
*/
  }
