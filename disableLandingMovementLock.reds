  @wrapMethod(LocomotionAirDecisions)
  protected final const func GetLandingType(const stateContext: ref<StateContext>) -> Int32 {
    let wrap: Int32 = wrappedMethod(stateContext);

    if wrap == 3 {
      return 2;
    } else {
      return wrap;
    };
  }
