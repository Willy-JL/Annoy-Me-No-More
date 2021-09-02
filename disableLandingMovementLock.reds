  @replaceMethod(LocomotionAirDecisions)
  protected final const func GetLandingType(const stateContext: ref<StateContext>) -> Int32 {
    // return stateContext.GetIntParameter(n"LandingType", true);

    // BEGIN PATCH
    if stateContext.GetIntParameter(n"LandingType", true) == 3 {
      return 2;
    } else {
      return stateContext.GetIntParameter(n"LandingType", true);
    };
    // END PATCH
  }
