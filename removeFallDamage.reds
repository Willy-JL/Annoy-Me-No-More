  @wrapMethod(LocomotionAirDecisions)
  protected final const func GetLandingType(const stateContext: ref<StateContext>) -> Int32 {
    let wrap: Int32 = wrappedMethod(stateContext);

    if wrap > EnumInt(LandingType.Regular) && wrap != EnumInt(LandingType.Superhero) {
      return EnumInt(LandingType.Regular);
    }
    return wrap;
  }
