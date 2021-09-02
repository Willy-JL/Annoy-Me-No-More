  @replaceMethod(LocomotionAirDecisions)
  protected final const func GetLandingType(const stateContext: ref<StateContext>) -> Int32 {
    // return stateContext.GetIntParameter(n"LandingType", true);

    // BEGIN PATCH
    return 1;
    // END PATCH
  }
