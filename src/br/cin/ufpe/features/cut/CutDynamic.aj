package br.cin.ufpe.features.cut;

import driver.util.Util;

public aspect CutDynamic {

	Object around() : adviceexecution() && within(br.cin.ufpe.features.cut.CutFeature){
		Object ret = null;
		if (driver.util.Driver.isActivated("cut")) {
			ret = proceed();
		} else {
			try {
				ret = Util.proceedAroundCall(thisJoinPoint);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
}
