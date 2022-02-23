@wrapMethod(LocomotionAirEvents)
  public func OnEnter(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    wrappedMethod(stateContext, scriptInterface);
    let deathLandingFallingSpeed: Float;
    deathLandingFallingSpeed = this.GetFallingSpeedBasedOnHeight(scriptInterface, this.GetStaticFloatParameterDefault("deathLanding", 1.00));
    stateContext.SetPermanentFloatParameter(n"VeryHardLandingFallingSpeed", deathLandingFallingSpeed, true);
  }
